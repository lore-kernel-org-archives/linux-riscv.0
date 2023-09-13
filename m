Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA3F2EE3F3F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Sep 2023 00:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yMRn0O8IOrKKYBVhNHbiEGS5+S+tLZroimiU9kzmaK8=; b=dRc3kxuAMTopm9
	QgkxtLnuOmSK4ngmroTK+oEHG9Dw4bRsjVQ1GDHXt8o+WcYc+hfED0WR4L1vy3kLAD/XhRr1wePIF
	toZNV05RSDHgGxnBvNSIvkr9jVuRglmUD5I7FuXC2RuOE55Hl+TE14t4iotoo9gLI6V/02uhaJPFZ
	vf0fvLOuVxj7iqD5sQBR0LC7hiUWgrJQMjHWVCNGSGUh2ol81fVHQxGxhBT6CWiVYylDW/cbMKGno
	1/vooalR1F6IM1ykVfcee84s39zwBIg6SVtn+jVGY9Glj7CfzMJAlMbmrAV6nWO33RUlA1vS2t6LT
	3WpqexlLbQs9Q1K7XybQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgDfE-004LIT-0n;
	Wed, 13 Sep 2023 00:23:28 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgDfA-004LHK-2E
	for linux-riscv@lists.infradead.org;
	Wed, 13 Sep 2023 00:23:26 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1c397ed8681so29994445ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 12 Sep 2023 17:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1694564600; x=1695169400; darn=lists.infradead.org;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IMa4ESenRbt+40AQIQozWuNk8NwNSRQGuKIsK+XbbO4=;
        b=Bno5Nds5prCNOyQ9uFSWjXjhpbGBalmjE24p7PV0ftVp95oBEufp+fUkYPi+kl5Uor
         z942pRMDpqBfvAbbdMOqk8vb4je7LYLOiSdT+cZoB+WLXPWW0q2v/ULL0XhLXKkBOB1B
         uP5j2x65vqZeRvYvlTCoe1pwMee+k5j5o3IacTkllJeQfbDy4tq8/+MRS8hmWwtZX/3p
         4S31sAFFMDLkhRKmrPWB1M3Z9MjTJiPo3qaRoZAvdbS0bnaX1ozte32AOiDPFWwTuXJt
         9MbDZSAn66h2iFybDK1zLUoHCb027A5arfm8VV/bpCyrgxsmftWgluOqJRkEEzmlgy8c
         5uVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694564600; x=1695169400;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IMa4ESenRbt+40AQIQozWuNk8NwNSRQGuKIsK+XbbO4=;
        b=S66hFF42qBlcKM+rTjqYhce+LLc5+TMVj1O+E63W1Po0JDR5FTLqCdohJkse2p+h6F
         uH6tg9ESXH2XjSP46NCAD/dBELHR5HdJA0rpcHprdpqWc7r3ScAI1TddUPcUH9fkMGUn
         KbMOlBD3K4VJTL2sfy6rOeESbpgWO1NJkwKVnB9AmoiOcK33QZD9Mnn9fzCJgqD6Gu8e
         TQ3q/j6KVdWciLkwL7UhhsxS92Y5ZI5CGaJle7FGr5Ajv+CymVgYDxzh5cMj2dEBdD9h
         mjdLI/2bi0zp2LShGh9RAOYHpeAGAhU1SMVPradEgFN9sv7PGMUUAYWUdnQ3VUB00qUK
         04Kg==
X-Gm-Message-State: AOJu0YzokjNmcxpLBBRyQI4SoACe50plgXFHJet+3zvVqvlLtXziNzO7
	+5QvBxgYoaiR3zyg3/Auvq4IwF3McxqL0gajPfI=
X-Google-Smtp-Source: AGHT+IGUViDwTFl5mghyMFB4Vn0imacJ0bNU7cEqwkta826DwmeC0XDVnGms2RhzOxGkR8CD4QWdhg==
X-Received: by 2002:a17:902:7c0a:b0:1c3:2ee6:3802 with SMTP id x10-20020a1709027c0a00b001c32ee63802mr1002659pll.47.1694564600255;
        Tue, 12 Sep 2023 17:23:20 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id jb14-20020a170903258e00b001c0aa301703sm9057779plb.63.2023.09.12.17.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 17:23:19 -0700 (PDT)
In-Reply-To: <20230906095817.364390-1-songshuaishuai@tinylab.org>
References: <20230906095817.364390-1-songshuaishuai@tinylab.org>
Subject: Re: [PATCH -fixes] riscv: kexec: Align the kexeced kernel entry
Message-Id: <169456458172.23158.6375457839178821869.b4-ty@rivosinc.com>
Date: Tue, 12 Sep 2023 17:23:01 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
  aou@eecs.berkeley.edu, lihuafei1@huawei.com, Conor Dooley <conor.dooley@microchip.com>,
  liaochang1@huawei.com, lizhengyu3@huawei.com, Song Shuai <songshuaishuai@tinylab.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_172324_726928_5453C3CB 
X-CRM114-Status: UNSURE (   7.87  )
X-CRM114-Notice: Please train this message.
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


On Wed, 06 Sep 2023 17:58:17 +0800, Song Shuai wrote:
> The current riscv boot protocol requires 2MB alignment for RV64
> and 4MB alignment for RV32.
> 
> In KEXEC_FILE path, the elf_find_pbase() function should align
> the kexeced kernel entry according to the requirement, otherwise
> the kexeced kernel would silently BUG at the setup_vm().
> 
> [...]

Applied, thanks!

[1/1] riscv: kexec: Align the kexeced kernel entry
      https://git.kernel.org/palmer/c/1bfb2b618d52

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
