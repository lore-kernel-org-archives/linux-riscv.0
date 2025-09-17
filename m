Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 761B0CAC598
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Sep 2025 06:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+9JNDM3ZL6XwgV5q37sAw6nUuyrheMoFV1LKKWZ9cB4=; b=PEdWik4XmJ85d9
	ZcbJxKmOsz6j/IwE9Hyu/oOS2qjCJFlGO0QJY+m5HD/3VErwbu3TKMSg7AtXlJzQi/8A2bpsWHVkH
	DTtqZKuYUHm3hSnfRhsSQDvb3wpBquWcz5BLV/nfmzHcTrGsZYtaCy73E9WaxJhDhyYNxUnQ7N9rZ
	nz3YuBFNie+CVINks3iEwC5k38NorI4Ilur3htSw4UR6smpRMBehuVpMTslASInX5DQk55hZxP2pA
	4pEKxmQk6VN+AlGqtZvlpxYnngeh8REFPZP4dCf7FPoDFOk9P1c5Ue+VY1lL0Voihex2jXK4R4F7E
	D/sEnJB7+Xy2FJGYZFLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyloB-0000000AM7L-4Ahy;
	Wed, 17 Sep 2025 06:38:27 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uylo9-0000000AM6X-1T7j
	for linux-riscv@lists.infradead.org;
	Wed, 17 Sep 2025 06:38:26 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-7704f3c46ceso5547138b3a.2
        for <linux-riscv@lists.infradead.org>; Tue, 16 Sep 2025 23:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758091104; x=1758695904; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9a6eDfP+fBc1ozuBGmtJ5qlwX2HPSbOLB5AoahUZfu0=;
        b=H82c2o1tPBIMQ0txzDtJp1fv4fcmga6WjGVW0OD8YGyLalGgb7vOTdj8lT+Kqe07Be
         qXoZRJKhDNK6MnIWSkyKmg69gWx8UJE2JYlyqlCnpLcEZEQgI80UG5uqUxDbm/BnYThV
         2+hrU0742wydN6xVZzxYddFWbgvz+g5FyOIDnzF/Wo8w4ZwAOdgqMyntIyPg+ihGtg43
         +FxlSWdU8W1ZoID6Q7NuXp8b/d/BFuLj9IKw1jx8HJVjxcLnMhrD0IEGxRqZ/7bPZWqR
         APEdTqcawTOB214l/HnCa/eqdtubZkXcATJhAhnXiUk1G/exW4JK5IxDDMBFO29wQISf
         ApyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758091104; x=1758695904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9a6eDfP+fBc1ozuBGmtJ5qlwX2HPSbOLB5AoahUZfu0=;
        b=moyYNt0FYO3Phb4unfQPP10q1FhULoim+AgI/M08yLB11C9yGrpQLxlsQOzqZqqC0o
         6MR5TpJKg3Z1delvRc7RdULRKxhR3OfqaqUMudSKqfNheFFadc2esQ/ADB2RVme8gEJo
         pu+sa+gtbsA41HtOP288MnQkRdJjE9Yo2uikNdZLFACKaNUH+CxEG2FgqF/SmPUVpzye
         2SjXNmB6vmpiGgWG/M4GCRiMNBCBzBdwlYr3ZBLDNDQ2dTIHbbM6oqU1jqw3H1YdHnCw
         JjnLgwoo3hMNAK1XKV+cp6LX0rEkc/d6034NruAs4uKhZngjTRqGvcjGuDkkY12jSaxn
         WKUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVV7rZtO19BTDCRmM+EbUyZ7zL0+YhnK69mxipBmFOVdFqpDrBhnaHVdjSL9bF61km8pf959FRoQ6TLA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0xTj+boqtTYCX7m59IUTV+1ol6sW1t+07XuSVHjrVB42juZQX
	TpI0iW7bitvibP6UUj6dVqpqmKxoOLkT/sjgPyq8IVFHZ4tv8Ypgt0cv
X-Gm-Gg: ASbGncsAbphHQ9H6OeYk5xogo7REj4gMBUpZVVEeseSatA2a9Bxdyjab3J/GPc5u0qu
	MhIq5tDaO/5cbn6oHJDlaHnWio921wTX631QRBzm0ovQRN/+sqo/5+1TPrXiljrhYfsDsTIWiFN
	4IvXE2KqF0syFFbHIuBPeHk6FxcRk7FI6yvpJ/t26qnJUQcloVQUAmBClKFVtTuGVgYZVJJGZlb
	jQ+Oxxe5ByPHFzilZH4EeaIaOLplMDB1oGiO74E22wymeBGW9dyZAfkZ13VkNjhouiKGPgdFT7w
	vw12ODoX9hfg4UeFIfCKnA5b4bGGtE+5Z3XwjQVzTqn2YsrJBYQopbzrWx+6MXzFxyoE9WbSnlq
	UxSXnI4ktrsDvgu1pQZi1sw==
X-Google-Smtp-Source: AGHT+IHq6XZ5/++BtlIMzWowm21SXwFZ/EFsiRjC685ax8WDJ8CH4yI13VvPILnIiTf325I/TiMPPA==
X-Received: by 2002:a05:6a21:6daa:b0:263:81aa:d60d with SMTP id adf61e73a8af0-27a911974e0mr1470121637.14.1758091104211;
        Tue, 16 Sep 2025 23:38:24 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-77607a47310sm17432570b3a.27.2025.09.16.23.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 23:38:23 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Nutty Liu <liujingqi@lanxincomputing.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Zixian Zeng <sycamoremoon376@gmail.com>,
	Han Gao <rabenda.cn@gmail.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dts: sophgo: sg2042: added numa id description
Date: Wed, 17 Sep 2025 14:38:08 +0800
Message-ID: <175809106542.461740.14901329077964229669.b4-ty@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250910105531.519897-1-rabenda.cn@gmail.com>
References: <20250910105531.519897-1-rabenda.cn@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_233825_387066_68048B99 
X-CRM114-Status: UNSURE (   6.54  )
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

On Wed, 10 Sep 2025 18:55:31 +0800, Han Gao wrote:
> According to the description of [1], sg2042 is divided into 4 numa.
> STREAM test performance will improve.
> 
> Before:
> Function    Best Rate MB/s  Avg time     Min time     Max time
> Copy:           10739.7     0.015687     0.014898     0.016385
> Scale:          10865.9     0.015628     0.014725     0.016757
> Add:            10622.3     0.023276     0.022594     0.023899
> Triad:          10583.4     0.023653     0.022677     0.024761
> 
> [...]

Applied to dt/riscv, thanks!

[1/1] dts: sophgo: sg2042: added numa id description
      https://github.com/sophgo/linux/commit/4d94abded400a5194b929c26b3aa07fb9485fe35

Thanks,
Inochi


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
