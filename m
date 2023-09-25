Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31575CE7A8B
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 03:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BFz3V7hW6IIfZxSRP+WTZQhu3YO5S3I/zrS7fNIyTCQ=; b=fuiyp9vC1a5znU
	xhre8tFtW6NjLmivueXwbnnBxHCdVuyqdG+PTiNtjhmPhfoK6gAAPYp+RmbHtJ9X0E2ujKZiO0Dw9
	8jccQVZKxf0WwhJlm7KXxGox5jqIE5+Ka5VNGKGiUZ2oj2feqav8gr72OfnUIz6az2XjvjJnr7jSs
	0HmT/wlJYBwmL+SAvwUmD3ixztMCzNdwbPrw/2S6/35UzlvtrSjZmF95ja6g0seJZkulmrc3eLpn9
	RZ0/1noonU7y8a1K17U2c8u2zhE/A6JCOgJXtymfHl1tZvSrIy/XN30/bFZj2l/BwqIZyyJEFDUT7
	pgSUYjTEUFehyYcla90w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkc8Q-00DDhm-1O;
	Mon, 25 Sep 2023 03:19:46 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkc8L-00DDgY-0X
	for linux-riscv@lists.infradead.org;
	Mon, 25 Sep 2023 03:19:44 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1c60a514f3aso16993825ad.3
        for <linux-riscv@lists.infradead.org>; Sun, 24 Sep 2023 20:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1695611978; x=1696216778; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tun3obuVK7/qfAB+oJbmril64B5dSAF0AnmI6yjr2CE=;
        b=3I/hK7LK89eA1XC4pqLk+bbOqmVOqKqT4Ho4dO0LjWGSNUAPUUDFeV0i/5Px0g4hos
         gd4WKECNmAco5hcuRXFoyOIG3mLm+CZEVCIr2/noha/JczFA5k+e+fE75BWT8gd6AQBh
         NfqBX7wT0ey2al5YbSkpYKMG07vR4iEjvvcw7oyA5AI5/fi/JSPzZfxaeJCGlErqvuuQ
         BhAI0H0cMHiytAAdHcGHkXnSx54QbYmBnRs08cDyDuYZe+KZYUihrWvihQ0qJUEUv3HG
         OPKCq2oMrmlDd4K8YiA/JNLUwu6jy7H6wFPDn22w/wtnyN+fKuf97kJfIgJQcgnUwzyu
         c5Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695611978; x=1696216778;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tun3obuVK7/qfAB+oJbmril64B5dSAF0AnmI6yjr2CE=;
        b=XFjduC8tuh8owXhHC9xSOKUjPSizm5Jxt/OH0WCBA4YYVRMccsMVzxGOhSaKu5qOnd
         7psgB1aZfYoTfC49OJs1CYuTtvkjxlbm8Vjkt5hybGjnvkIOWMicqScg9JWOzsVhGJv1
         5W59vrvYa3dLl4Xy8yPzn6UfLK4IJMq1F5kSHZcJBc2mZEYDiMVLKDZsj8LEQxEN4I8R
         6PLvwOsjqw12KVmHw7TN35cr0oihcMCLPd0fqzyDwsu1c3O/DIDI5s+YggNN5VTab/qQ
         pEzPmMGC6cNGfktRlQmmmxkrIH16itssWr6uXvi8sdoA73LAM5v9Y0xajW1w9xmICcPA
         FoWg==
X-Gm-Message-State: AOJu0YzqaOCqy61tEbCutHZNodqwQcUJcYFmRYdrvbxgvMk98R55VNZx
	W0JPQMSNuobYr5IIW2evRfY+/A==
X-Google-Smtp-Source: AGHT+IHNh3CDHzKHWP352efmB+pht1EDZ+muot20T/hrn57jAEllX7kZO6Ss70OKhS9xW4BgM6UwEA==
X-Received: by 2002:a17:902:cec1:b0:1c4:4dbc:92a3 with SMTP id d1-20020a170902cec100b001c44dbc92a3mr6737645plg.29.1695611978659;
        Sun, 24 Sep 2023 20:19:38 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:ecfd:15f5:ab42:52dd])
        by smtp.gmail.com with ESMTPSA id u6-20020a170902b28600b001c61acd5bd2sm934195plr.112.2023.09.24.20.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Sep 2023 20:19:38 -0700 (PDT)
Date: Sun, 24 Sep 2023 20:19:35 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Andrew Jones <ajones@ventanamicro.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Jessica Clarke <jrtc27@jrtc27.com>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC] riscv: Script to autogenerate instruction handling code
Message-ID: <ZRD8RzBeA2RMrcki@ghost>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230924_201941_420160_3AF39831 
X-CRM114-Status: GOOD (  14.12  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

I have heeded Andrew Jones' advice and written a script to generate the
instruction handling code. It is still in development, but currently
lives on a fork of riscv-opcodes [1]. I am interested if what I have
produced so far is in line with what people would want to see.

An insn.h file can be generated by running the following in the repo:

make
python3 parse_linux.py instr_dict.yaml insn.h opcodes_config variable_field_data.yaml

I have pushed the generated files to the repo so people do not need to
run the script.

Each instruction has "variable fields" such as registers and immediates.
For each variable field that appears in any provided instruction 3 functions
are provided: extract a variable field from an instruction, insert a value into
a variable field of an instruction, update a value into a variable field of an
instruction. Update first clears the previous value of the variable field of the
instruction. Then for each instruction, the script generates a function to check if an
arbitrary 32-bit value matches the given instruction, and a function to
generate the binary for the instruction given the required variable
fields.

I was able to use riscv-opcodes to parse the instruction files, but
needed to create a new data structure in variable_field_data.py [2] which
holds the positioning of immediates inside of an instruction.

I envision that opcodes_config [3] would live inside of the kernel alongside
a simple script to call riscv-opcodes (that resides somewhere in the
user's file system) with appropriate parameters. When somebody wants to
add a new instruction, they can add an instruction to opcodes_config,
run the script, and commit the resulting generated file.

If this script is in a direction that people like, I will continue to
fix up the issues in it and try to get it upstreamed to riscv-opcodes
before I send a kernel patch.

- Charlie

[1] https://github.com/charlie-rivos/riscv-opcodes/tree/linux_parsing
[2] https://github.com/charlie-rivos/riscv-opcodes/blob/linux_parsing/variable_field_data.py
[3] https://github.com/charlie-rivos/riscv-opcodes/blob/linux_parsing/opcodes_config

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
