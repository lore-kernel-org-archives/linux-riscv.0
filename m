Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C4B7C4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Dec 2022 01:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oHEM9ucTINh+BZCMi56B0K6C3aJWvPjv8Vop+3qhd/Q=; b=OdJ8j7i40UM4de
	Yx3ROVdoModrBwsMQVQkTOWMDhQTDKAp/ygvm/HXyXlTR3PBm47dKITzl1sFe98OFu1m3cSLYw3uU
	FPJFxFbX/3j4Ie3mDaf0iqchi77AQoPwuv49BcDuv/PHZx/5E0pBRs/2bGhLsNix4gOeMhotRe9dc
	JKv3qCVzwg2IrhagEOPGsCUmjEBKwFCxKRxIe6WtHJV4IucZoji/ZBYihH42oh3xMmy4vvrtzA6vW
	mAbV8dS/rdH5eY/kWkxjoR2gyL9gtNzFfDZBIAa5J9j/4YKK7iv+ZBspdY7gAH4hccIlFiKnnyKY/
	DfDndbtZzHsZv2P+Btug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3S87-00HZgv-Nm; Fri, 09 Dec 2022 01:24:47 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3S7Z-00HZ4I-1w
	for linux-riscv@lists.infradead.org; Fri, 09 Dec 2022 01:24:16 +0000
Received: by mail-pj1-x102f.google.com with SMTP id t11-20020a17090a024b00b0021932afece4so6490117pje.5
        for <linux-riscv@lists.infradead.org>; Thu, 08 Dec 2022 17:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y9JTmHTOPl5nDm1yqUNn/t1md053yskw0F3nV+0Iu4E=;
        b=4/uk2xVAf9F+AhylLvf7hNvXalorjC0kckBJRFq0Ukam/mK6lCG9KmEKa8n3+Ii/o9
         S8uUmzItrT3g8Zy2aX1GJJ71wgwgRde3VuP/Ndoeza3B4/X95VCOKj0WB89Kq2LTqOaQ
         5qv9c0oJlYf4VSI6z1yDnCD/O0iGV4j0P+heHepIyeV7jNkpvL/C/tFkDL0I46u5uMrx
         7YXXcvZWWwtfp6E9FN+fLNZWiPkTkWnRsrpMcNkgtptYZYpdr7XRzmiuZFN39TDGgBt9
         4PiK7o4ho9SaFv8lGBgP0BAOvHdWwtzJ19sz5DGBA7SaGPl1Wmm5AegRYcRylKbnLmiE
         t7lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y9JTmHTOPl5nDm1yqUNn/t1md053yskw0F3nV+0Iu4E=;
        b=ldHN0m6FC1dcXeLWrqo+48KvVIeE24H85ZVxvA+VlwE7dPguGBOdD+O9qFNzlNERFW
         Oy5f5wRZrmUv1YxPWoto+b8rOWkcR12qkaJNkrFDJXUKIxmhRXTr/RHHTl7/HywjQj1J
         SrCCKe2/v0HA0HzvmXp0gdxXZf7zvILZ5MQKcFo56Prt+ElpvkQXK8I4J9YyBiPQ1L5i
         FS3odJaPovFsKBoFjojAVi43maPlqumAKniCsZ3ZDBEVfsrsmGiIkfZd6QrEXZX9jd2i
         Yr5jiv4iCwjhueS4MJhlnk3EDkxJePlJa5FSouEPmfGqvlefp4TWxO2X7iw5f2yaxNlN
         mh8A==
X-Gm-Message-State: ANoB5pmLJHm9WcbUVA73A9OzqXboxRuzG+G+hcnHmjReh+bx3jV+NGq+
	n8+oM9IzTtPIuQosKma6xdTrKC2olNVowcqU
X-Google-Smtp-Source: AA0mqf6ZBDYmBOsr/DQRLosH+OJ7jt/dIxHQQcuu5pXgirF4LnFvYmQKTT2R3sNhgPKR8SI2SFihZQ==
X-Received: by 2002:a17:90a:d984:b0:219:6619:848a with SMTP id d4-20020a17090ad98400b002196619848amr4077841pjv.36.1670549052230;
        Thu, 08 Dec 2022 17:24:12 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id s13-20020a17090a764d00b00218c5bdb983sm100541pjl.22.2022.12.08.17.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 17:24:11 -0800 (PST)
In-Reply-To: <20221123150257.3108-1-jszhang@kernel.org>
References: <20221123150257.3108-1-jszhang@kernel.org>
Subject: Re: [PATCH] riscv: boot: add zstd support
Message-Id: <167054670411.18962.4800542300432507524.b4-ty@rivosinc.com>
Date: Thu, 08 Dec 2022 16:45:04 -0800
MIME-Version: 1.0
X-Mailer: b4 0.11.0-dev-e660e
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Jisheng Zhang <jszhang@kernel.org>,
  Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, Nick Terrell <terrelln@fb.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_172413_180240_71F43598 
X-CRM114-Status: UNSURE (   6.46  )
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

On Wed, 23 Nov 2022 23:02:57 +0800, Jisheng Zhang wrote:
> Support build the zstd compressed Image.zst. Similar as other
> compressed formats, the Image.zst is not self-decompressing and
> the bootloader still needs to handle decompression before
> launching the kernel image.
> 
> 

Applied, thanks!

[1/1] riscv: boot: add zstd support
      https://git.kernel.org/palmer/c/de59b6ed0618

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
