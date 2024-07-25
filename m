Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E3FC3DA49
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jul 2024 19:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Re39B09DQiqaMWo3qqUzjXjz0P/vxht9txJUYtauu/0=; b=NcN8CnBiRhOl1a
	eTe0Hf9ChlCZdDd4G8w1FcJR0qqsfcddAi04U5LPfB+C7QL22P8o5YGlDH4lgpgZbWXViXq0EYyGf
	ObVaDwHCiUv9rZoGtITgB9Ug8FTV4kWAc1A48GNcl/xUULD4O516R1xsTgNzIqTP3yAKnMkIWOPzl
	J6gbVZkoZTvK0MQlvoVBzcDn90bM+/VHzcSjlUiwbOn9Xzm1KM3W5vK4wjvUQfJOcNQ52IHslPrwJ
	XSVSEhFHPlXVoSYLjaCFgxviCxr/qH8tfhnYUQcO0ZCOq7HvoTAXALHEoPE5coz1P3VcVEXl/2bu8
	/Z2Ait0dkuBsERAjgboQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sX3hL-00000001qap-061y;
	Thu, 25 Jul 2024 19:00:19 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sX3hH-00000001qZd-3Ku7
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jul 2024 19:00:17 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a7a8a4f21aeso112290966b.2
        for <linux-riscv@lists.infradead.org>; Thu, 25 Jul 2024 12:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721934014; x=1722538814; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1SXRSsqZz92FEOTrBrR6i2ym9WcdF3m0UDq9oqJ8/V0=;
        b=KsCrrRudSw3ij8fA4PsPE9aBYrUIIxz6Ai1TozZRtx2/z9oT7f+MUaRWdKaX2snW/u
         0DfeT/l0keKkYLxPt+nBmnrnj/RaVKRmeRbQLq2Q6p0zRfXYVnFtkjKeg2jjgowK3Xvy
         iXv1FDTcQQn+FLXloh4m+rXORjnZPk0Ay4LMzsZkrC1QwA5pgQwfzeXC0P1U16B+pCeE
         hUE2E+a+agxTetxoRYjgY4aLAUrqO48kFcPlORhRrsuoKxkiFido+lXDkEfE4HvDG0D0
         B78s9+w8HNazCdo5z5aDYa58eYA7ManNCkHBsUMEhHPJm5fUxxJxge8KUMeHuOQEjGRQ
         gBYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721934014; x=1722538814;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1SXRSsqZz92FEOTrBrR6i2ym9WcdF3m0UDq9oqJ8/V0=;
        b=AbWAWlyRM2vJLTt9AilZj/nfqcMZmoLIom9bCXBcNCCWW8zYdO+7k/7zw5SYx3vh6k
         p/dluWhkzcO7mo//Q54L3hjrb16YVIiJiNnP4R4nlyOpGRTrGYWa26Fs5sPapyfIfwW0
         5KDB+Ilqn28t7FA1pSSPVphLbi2gSjBrUhlnIgQBAsmbBlRRn/J3/CRVzVd28CumBwcW
         NRf8eEY+QkY2xt/gRuhHVQWtQyFCd/5+GDCxiAtRrBhuRHm+IeLXQ1kmfwXsqxtd2G5/
         wmFSaprMdsuxXbiTuGyVdaLpqmkiDV4NY+wbBJRc+UOoxxAutSv9JuoB/CC25OXgxOPm
         1PAw==
X-Gm-Message-State: AOJu0YzowRkTcti24AbqxeR/IBi39hy/NQUA1hy2TSzHO0k5NVlMGwO5
	IXhkK9qOTp69kObutmc1eIn9fTOnBUYNN1ckGOsoQwaXsEWi0zju711HnZchuvwLJD2x/9ZrUdr
	BqYO3gx7XFcOn0PD+eBjDyOQtlA02RqJamxgwfQ==
X-Google-Smtp-Source: AGHT+IFHUqdSVej/FJ48bmkUm2ijOZ5NIMkgNmJ5x7nyiK8ULyjrs0OUa2kOhzuQ5Wr4IrghMERmj1LuPI17mje/MmQ=
X-Received: by 2002:a17:907:6d0b:b0:a7a:b9dd:7766 with SMTP id
 a640c23a62f3a-a7acb4f9362mr226470666b.31.1721934014047; Thu, 25 Jul 2024
 12:00:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240724183605.4038597-1-jesse@rivosinc.com> <20240724183605.4038597-4-jesse@rivosinc.com>
In-Reply-To: <20240724183605.4038597-4-jesse@rivosinc.com>
From: Evan Green <evan@rivosinc.com>
Date: Thu, 25 Jul 2024 11:59:37 -0700
Message-ID: <CALs-Hsv9KTz8crZ3BROuug-xzA-d6yG8wQR-Ny+5qmazhFHWBA@mail.gmail.com>
Subject: Re: [PATCH v6 3/8] RISC-V: Check scalar unaligned access on all CPUs
To: Jesse Taube <jesse@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Xiao Wang <xiao.w.wang@intel.com>, Andy Chiu <andy.chiu@sifive.com>, 
	Eric Biggers <ebiggers@google.com>, Greentime Hu <greentime.hu@sifive.com>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Heiko Stuebner <heiko@sntech.de>, Costa Shulyupin <costa.shul@redhat.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Baoquan He <bhe@redhat.com>, 
	Anup Patel <apatel@ventanamicro.com>, Zong Li <zong.li@sifive.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Ben Dooks <ben.dooks@codethink.co.uk>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Erick Archer <erick.archer@gmx.com>, Joel Granados <j.granados@samsung.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240725_120015_857758_03D7B8C6 
X-CRM114-Status: UNSURE (   9.23  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBKdWwgMjQsIDIwMjQgYXQgMTE6MzbigK9BTSBKZXNzZSBUYXViZSA8amVzc2VAcml2
b3NpbmMuY29tPiB3cm90ZToKPgo+IE9yaWdpbmFsbHksIHRoZSBjaGVja191bmFsaWduZWRfYWNj
ZXNzX2VtdWxhdGVkX2FsbF9jcHVzIGZ1bmN0aW9uCj4gb25seSBjaGVja2VkIHRoZSBib290IGhh
cnQuIFRoaXMgZml4ZXMgdGhlIGZ1bmN0aW9uIHRvIGNoZWNrIGFsbAo+IGhhcnRzLgo+Cj4gRml4
ZXM6IDcxYzU0YjNkMTY5ZCAoInJpc2N2OiByZXBvcnQgbWlzYWxpZ25lZCBhY2Nlc3NlcyBlbXVs
YXRpb24gdG8gaHdwcm9iZSIpCj4gU2lnbmVkLW9mZi1ieTogSmVzc2UgVGF1YmUgPGplc3NlQHJp
dm9zaW5jLmNvbT4KPiBSZXZpZXdlZC1ieTogQ2hhcmxpZSBKZW5raW5zIDxjaGFybGllQHJpdm9z
aW5jLmNvbT4KClJldmlld2VkLWJ5OiBFdmFuIEdyZWVuIDxldmFuQHJpdm9zaW5jLmNvbT4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
