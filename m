Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 694EFFCC9A6
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Mar 2026 08:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lyjA3wzAyF+vEsWtD1Bk0Mn85bCxYedHAcBntv7t4oU=; b=Qbaki3Bu+usHPE
	wRim+5CIweXSXkcINS1LXRcEczrQWC+HaCwco/RkVvK6jRP15aOWKpyecZbSPh/+bC86qrw3x1Wmi
	NaIwrR8K5KIOjuzyY+sNEjHcizhWWKa4GXPTvHYAxuaOmmHnJkNPwW/obq6J+ViUT5BLimoNbx39r
	BR1Kq4/5Nqov+cWvmSbX4FnrjCk3UHds4+53BungCVZVYyw0nBcSdcBPHuZhoB8pctdlZ64GOrCGD
	G32X/ySVJDGYA+koo8V8FcuZnFlzH4uwKWwXFh6YtqaMS4Bwr93/+3yHGmPeOxo7N7aWgM7lt2aCy
	GWAgnk/2EmtPnmryzUGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzsHu-00000008vMi-40S5;
	Tue, 10 Mar 2026 08:17:58 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzsHs-00000008vMM-1Pd5
	for linux-riscv@lists.infradead.org;
	Tue, 10 Mar 2026 08:17:57 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4853c3c2fe7so11048775e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 10 Mar 2026 01:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773130674; x=1773735474; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MO3msijVzQef0Ud33m7vixv95BaMpuOqd6DBMK2avXw=;
        b=AKUTu+iYGBwnFGRZRkG0yIuSkoCX7vD1j2gg9pGRvuAir6CNMokpZ/1Xq0JDKPYOoo
         UPf2Jds5s7j6p4EwEfBir/wUpSA4LSfuEsi6PHXpWjXhtbPUSrJ+J07x0+IdRhy7Kg2d
         vBjxhRnvX0yq1DCpcpVDkkozuloejkZdXs9YbzWu9FNpgaOqWeUyi/XJ/3kUUCL1pogh
         CFJTvEsx/iibmdBqJmtcQ/V6Eet+I1gCXWkB6Eg5LFCMXc3PmcmgNBOBmXBnzcBK7Xh7
         ie9iUMTWfgBpfxNbC9E7si/VsVQ7b9E2XhoUC29eEDPaOfmh5heNc151V4gsU2/dZUZD
         nt5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773130674; x=1773735474;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MO3msijVzQef0Ud33m7vixv95BaMpuOqd6DBMK2avXw=;
        b=RoUxMdVG7ELNaPRLVcZ/wA/c4tV/OY9jpTlkavy+iEQRs/xQy6evCIYk43ByoHu8xF
         1WgCz95goRjoQugGP5rBlGmGPW7jC+fqE+b4+NZhtRT6YWvV+GvqWzzkMLPuv3L6wv4X
         6VJfPoCHkJpaRgbDAWpkYE7LKsAYangmrlV/h9y4S3bGjcX+VPypWj5CfCLL7o9qClwo
         zFSW7bUxSxlWIyOdyTiOg6aS8KZJ3xmuoLkW2yTH8l348vUZRaoVE0SPOBgUBQDbX9Yh
         qNjeAZvsX9ikdJaE+8X789KC6vy4xwHBYX85GpMbzOYfAd90i3zHpOMrAmdnfn4osCdP
         a9tg==
X-Forwarded-Encrypted: i=1; AJvYcCU5E72AfYehg7YT2EhqrAoO98RrE6ovzu1eiLH03+96J7bdNrbY4FlQ3WiicnTdTq/WspcdRhJHA1TNPw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzPiGkkuqhYSBiuHT1Yz61v2qbCN3497dXSTMNRQGY2q+hfbAYr
	oU7nAGf8bT2iZy7oKT3vsTmSP6GJbKKUIQFNclVUMBghb4V0gh93+vyx
X-Gm-Gg: ATEYQzzP3T8jsYwQHn3jUmh8JyqywYJlpeTYrx9+6P9s7KHVubD/8yOmFWcuetLP9Af
	Yb071KxHaFq17q1tC0A5ELR0XIifvI1cHIvhEH2I+6JNQDYBGVHU3x/fOjo0aNCkHTiMXUOZf8C
	PEH7V/fdunAxSy38S8VEgoy3V5rJLF0fwvdFOAqpMc15umdRxKkjrMPWQzPsbDQ7j/UhVbAZj7g
	UXlHROfdGmJEzNbAig7Lw29hqsr/FjhSNBuhcLtOV1GO+mzs62h6xPsnV0TBxcYgRjnUpIlWTCx
	bAZXk2kirurpjIUT7wzzpGtH1f3KZ2VfzJO9buUoQHu9ZT7uq6ZKtSLXU1DaHKwycvEqeqtllnL
	1NCcNiQZ2lpAUtgzbvUUpOJNpi/g1Q1eZXUvzFcCWM1DuY6jx/B56D0AbEaeakfufQKYt1s92xW
	ZlQeNvkroBm91xnjFL
X-Received: by 2002:a05:600c:c107:b0:485:3eba:ab96 with SMTP id 5b1f17b1804b1-4853ebab021mr60513855e9.3.1773130673962;
        Tue, 10 Mar 2026 01:17:53 -0700 (PDT)
Received: from curiosity ([80.211.22.60])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4853588758fsm109596125e9.4.2026.03.10.01.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 01:17:53 -0700 (PDT)
Date: Tue, 10 Mar 2026 11:17:50 +0300
From: Sergey Matyukevich <geomatsi@gmail.com>
To: thecharlesjenkins@gmail.com
Cc: Shuah Khan <shuah@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, Andy Chiu <andybnac@gmail.com>,
	Deepak Gupta <debug@rivosinc.com>, linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] selftests: riscv: Add braces around EXPECT_EQ()
Message-ID: <aa_Trj0T53wMjKfk@curiosity>
References: <20260309-fix_selftests-v2-0-9d5a553a531e@gmail.com>
 <20260309-fix_selftests-v2-2-9d5a553a531e@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260309-fix_selftests-v2-2-9d5a553a531e@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_011756_403936_90F715E2 
X-CRM114-Status: GOOD (  13.84  )
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

T24gTW9uLCBNYXIgMDksIDIwMjYgYXQgMDY6NTI6MTFQTSAtMDcwMCwgQ2hhcmxpZSBKZW5raW5z
IHZpYSBCNCBSZWxheSB3cm90ZToKPiBGcm9tOiBDaGFybGllIEplbmtpbnMgPHRoZWNoYXJsZXNq
ZW5raW5zQGdtYWlsLmNvbT4KPiAKPiBFWFBFQ1RfRVEoKSBleHBhbmRzIHRvIG11bHRpcGxlIGxp
bmVzLCBicmVha2luZyB1cCBvbmUtbGluZSBpZgo+IHN0YXRlbWVudHMuIFRoaXMgaXNzdWUgd2Fz
IG5vdCBwcmVzZW50IGluIHRoZSBwYXRjaCBvbiB0aGUgbWFpbGluZyBsaXN0Cj4gYnV0IHdhcyBp
bnN0ZWFkIGludHJvZHVjZWQgYnkgdGhlIG1haW50YWluZXIgd2hlbiBhdHRlbXB0aW5nIHRvIGZp
eCB1cAo+IGNoZWNrcGF0Y2ggd2FybmluZ3MuIEFkZCBicmFjZXMgYXJvdW5kIEVYUEVDVF9FUSgp
IHRvIGF2b2lkIHRoZSBlcnJvcgo+IGV2ZW4gdGhvdWdoIGNoZWNrcGF0Y2ggc3VnZ2VzdHMgdGhl
bSB0byBiZSByZW1vdmVkOgo+IAo+IHZhbGlkYXRlX3ZfcHRyYWNlLmM6NjI2OjE3OiBlcnJvcjog
4oCYZWxzZeKAmSB3aXRob3V0IGEgcHJldmlvdXMg4oCYaWbigJkKPiAKPiBGaXhlczogMzc4OWQ1
ZWVjZDVhICgic2VsZnRlc3RzOiByaXNjdjogdmVyaWZ5IHN5c2NhbGxzIGRpc2NhcmQgdmVjdG9y
IGNvbnRleHQiKQo+IEZpeGVzOiAzMGViMTkxYzg5NWIgKCJzZWxmdGVzdHM6IHJpc2N2OiB2ZXJp
ZnkgcHRyYWNlIHJlamVjdHMgaW52YWxpZCB2ZWN0b3IgY3NyIGlucHV0cyIpCj4gRml4ZXM6IDg0
OWYwNWFlMWVhNiAoInNlbGZ0ZXN0czogcmlzY3Y6IHZlcmlmeSBwdHJhY2UgYWNjZXB0cyB2YWxp
ZCB2ZWN0b3IgY3NyIHZhbHVlcyIpCj4gU2lnbmVkLW9mZi1ieTogQ2hhcmxpZSBKZW5raW5zIDx0
aGVjaGFybGVzamVua2luc0BnbWFpbC5jb20+Cj4gLS0tCj4gIHRvb2xzL3Rlc3Rpbmcvc2VsZnRl
c3RzL3Jpc2N2L3ZlY3Rvci92YWxpZGF0ZV92X3B0cmFjZS5jIHwgMTUgKysrKysrKysrLS0tLS0t
Cj4gIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpSZXZp
ZXdlZC1hbmQtVGVzdGVkLWJ5OiBTZXJnZXkgTWF0eXVrZXZpY2ggPGdlb21hdHNpQGdtYWlsLmNv
bT4KClRoYW5rcywKU2VyZ2V5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
