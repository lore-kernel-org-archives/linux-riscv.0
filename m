Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD102CD343F
	for <linux-riscv@archiver.kernel.org>; Fri, 15 May 2026 06:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HULes8xU+wP8upqIgYQgg6OMXuNUldV0iSCCzt+NEKg=; b=tWO2u2zfXgfHMr
	Y7oONsTg8y37Tn/q8PivZwp3Fg/sJVQEk0cAi6vbLxZldiEDf3tl+IeliGOWru8Pj9/aeVMX6AqlB
	+leSQU0Clak3mdgqwZhWrD8gP6+rIeHHIx2mE3KScAJWBGBfUuiWcxVE/CqelWPWie0Xs7KV/O6k5
	+o1eimMEG5qGcw794xFpPCrY2ba9ULfkme6ZA/lpUzKpu2usyZRkiKDRHhv4TUFUWwXVrXS4jtYBm
	BBgIYBcO8umcv8YFECaCovg29pdg538QFhqsT8pvdNkfxFSSgortsY3QVXwVBIRsQlG/w8e2CdtKm
	0JLiTDcpmldiXzfm8P8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNmM6-00000007Xd7-2rPH;
	Fri, 15 May 2026 06:49:06 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNmM3-00000007XbW-21Ni
	for linux-riscv@lists.infradead.org;
	Fri, 15 May 2026 06:49:04 +0000
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-47cbd445021so5567831b6e.1
        for <linux-riscv@lists.infradead.org>; Thu, 14 May 2026 23:49:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778827742; cv=none;
        d=google.com; s=arc-20240605;
        b=a+JWgganDCiWPHvNlHHnsCZ3AC5aB1eFlWRuom/zUSmvCj/nI97nOpSvSfFPLUB5eO
         fUvY9JG/Oc6rrCLtVkXN1grGUJa8roDze6LrJ/tbypIMlAMqZtbFA1MuTk+Y9PoMFlXf
         sHq1t/lHKYATqqTzZOCNYNoXUBqaDOfP5ryBHc+YsX1wLNheFhAf8p7ErbGFQBu9f/Jd
         GhX4C1FR5QOrshDnUNFGz5DSZLX219PcYvr7UoVk3oeHB1/tkyG6SFlsmN4EseZFdWhE
         HRb217CwZiDa8itxHPhMVVrS7zdflbJnAv5rF2kwCyQGUVYhw2UNYhNSJcz1dGoVJQlb
         qlVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FHfxsuw0D4onwKk/YyQ8YkX6C3b41IlcaLUUVhpqyNo=;
        fh=b+W46VCUhQg43I55zV3m3EYrQS7ByZJgtje94CdX9qs=;
        b=KinEt7VEqPbyxnEkRRdkq4NziigfonJ07XTrSHv9/admlYaXLVe2kDnO7CaYLXz4U0
         LZwja4uB0A4pqK0v22/gpCNhrcTLf8ypoFSttmBgkZN/aofD+K6WxEDcldfUeriNu0zv
         kR+3Kb/thk9+cOK5tt6DKyS96ExMtnQVnKw+HrbYpjco4NEkEIiTlYcC6HPh03Dfvqad
         9EAG6bWdgCxxiCyp8HABDPcDXk6Qy1qveLzqTmIet+Yy8WhtDS5vkaLhlvJX0jcisQM3
         jy9qwIykeq5vzBHisbnvnJBkVZrQT20KJxrhCkbHwtPZch40CWZIiXnGfUES1NhSczO4
         t8gg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1778827742; x=1779432542; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FHfxsuw0D4onwKk/YyQ8YkX6C3b41IlcaLUUVhpqyNo=;
        b=wdfpT+RvT8QH9OS5WOo/4nSG0VxLrFKUkmzj0yslLp2bpHe1CP2HF7rnqH+UVNosyP
         +pM0N/MUTBqC2F8nNrYh8PVieO4YsbgWOjOgGn/0j1DuCQr0N5/Qgwyx/hupY77ws+Kk
         o0x1tj9lDmDLdzYGhs8J9rE5Pb1u32+P6VgTLYG5ZGXEFmPCO/jlMHcrFi+PhPKRmGPE
         gR+l8Oz55+vKHVPVnkCibAii8NhdINdrQC391ViuNuBcYPsdKEukvSR3uW/Z0h3qLc+7
         CG7zZhKzUgmwVcPz48BgQD1kBYTW82KXoqLQ5xdGepjKPmYWDr1qYZrk1bHuePIgg95h
         JOBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778827742; x=1779432542;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FHfxsuw0D4onwKk/YyQ8YkX6C3b41IlcaLUUVhpqyNo=;
        b=ipEu458Gb3LpG/oIu7f2IR5uLwh1AfLjcJYd+NeFAyEDzZoGJ1L//IKI9Q/kDtL3Qu
         /e9VoevUVGdR4eov0xtfCFvppLh9briZKe7rRz8UcV8eBXFBk9+8zIhrIbBzELHHfRIJ
         i8+0OQdZMTg6i17XT/eGvvHq6kc351nHzV5vuvVatfF2czHLYkgyx8pVxpGTxLnm5WlU
         e/NoA5Nd2uhsjzw2wv6a0SfI3ipizci2Mu9dlvyCSkXIYNxbUYnEcGc+HUnazB/OODB5
         493wPl9ESxuKq+a77ok6yH5DTYbexFn1mA8YxVOu94KPVmalDsqnPXyroPKCv/sxxPGm
         yuhQ==
X-Forwarded-Encrypted: i=1; AFNElJ/xdl6WWY2H4KfW+SUmFSXifntXMx5VzlzLI2W7+8MRNSFM/ByoWFO1XS+nu0gynOk1OCnZnW7RS7qkcg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzzoCzZUen1zVorzwoMhW0hCcHpj0PkFWgPbktKE6DxfEmfnXTY
	fZ4u5MlB2GQXyY+TXIHP+Sl1zyK8kn4hakGaDbnHh++xMnSYpfjG8If8t/bsdEnv7UZMusl+Pqs
	Etm4P3YeA1YYf0fNR1yjA+pBEbCEDGESjryPCmReiQg==
X-Gm-Gg: Acq92OGpd+vnGzCpYJGMZv9t7eBD9nFiCJTRRI4xwQxaEWjve/4xs2rOpM5OgdwawXE
	PBN5MewBMq0yOjqvFkMa78+u24DTYNZGJJ54BVAfp7QVBxqnv/PkVutzWSai4189DW0v38BjyhJ
	eClrY/A4Mp1Folu8C+YJ2dEP118QW9u5TLvBFwSbyEynO3tOnh84Y6QIsApXDJZv7Nu05CuP+CP
	rXlcm/R8AjoUsDbsFSVtq9k/4DAO5KHTgIaA/wQg1MoK41ABi9TnmgZM5H448d3FN+yEbBS3PYJ
	jjVk26U7jBB97gSmR5DnmAUeQnY+4B6dx7RntiJvUeD8vsFpyaq6E8WUxgLUc5kXzzLZ6nP5raE
	Pw/LTI0tFtQv/dbKndgT3pTl8HDBgAtQvxADlxg==
X-Received: by 2002:a05:6820:627:b0:69b:95dd:46f0 with SMTP id
 006d021491bc7-69c9437cddemr1610219eaf.33.1778827742447; Thu, 14 May 2026
 23:49:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260514173642.41448-1-osama.abdelkader@gmail.com> <20260514173642.41448-2-osama.abdelkader@gmail.com>
In-Reply-To: <20260514173642.41448-2-osama.abdelkader@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 15 May 2026 12:18:49 +0530
X-Gm-Features: AVHnY4LXgXrzLbMRAQUcA2m5MJLX3u-xm7PLLcuSO_7vFtenzJgf3TlQ9hZcJyI
Message-ID: <CAAhSdy2+CpDu4YFXVqSDji268fapqO3sgXOSUD+fNZs9Fdb2-Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: kvm: return SBI_ERR_FAILURE for pmu_event_info OOM
To: Osama Abdelkader <osama.abdelkader@gmail.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_234903_547054_22B65E4B 
X-CRM114-Status: GOOD (  15.36  )
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

T24gVGh1LCBNYXkgMTQsIDIwMjYgYXQgMTE6MDbigK9QTSBPc2FtYSBBYmRlbGthZGVyCjxvc2Ft
YS5hYmRlbGthZGVyQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBrdm1fcmlzY3ZfdmNwdV9wbXVfZXZl
bnRfaW5mbygpIHJldHVybmVkIC1FTk9NRU0gZnJvbSB0aGUKPiBTQkkgZXh0ZW5zaW9uIGhhbmRs
ZXIsIHdoaWNoIGNhdXNlZCBrdm1fcmlzY3ZfdmNwdV9zYmlfZWNhbGwoKQo+IHRvIGFib3J0IEtW
TV9SVU4gYW5kIHN1cmZhY2UgdGhlIGVycm9yIHRvIHVzZXJzcGFjZSBpbnN0ZWFkIG9mCj4gY29t
cGxldGluZyB0aGUgRUNBTEwgd2l0aCBhIG5lZ2F0aXZlIFNCSSBlcnJvciBpbiBhMC4KPiBVc2Ug
U0JJX0VSUl9GQUlMVVJFIGFuZCB0aGUgbm9ybWFsIHJldGRhdGEgcGF0aCwgbWF0Y2hpbmcgb3Ro
ZXIgUE1VCj4gaGFuZGxlcnMgYW5kIGt2bV9zYmlfZXh0X3BtdV9oYW5kbGVyIGNvbW1lbnQuCj4K
PiBGaXhlczogZTMwOWZkMTEzYjlmICgiUklTQy1WOiBLVk06IEltcGxlbWVudCBnZXQgZXZlbnQg
aW5mbyBmdW5jdGlvbiIpCj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiBTaWduZWQtb2Zm
LWJ5OiBPc2FtYSBBYmRlbGthZGVyIDxvc2FtYS5hYmRlbGthZGVyQGdtYWlsLmNvbT4KCkxHVE0u
CgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClF1ZXVlZCB0
aGlzIGFzIGZpeCBmb3IgTGludXgtNy4xLXJjWAoKVGhhbmtzLApBbnVwCgoKPiAtLS0KPiAgYXJj
aC9yaXNjdi9rdm0vdmNwdV9wbXUuYyB8IDYgKysrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9r
dm0vdmNwdV9wbXUuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfcG11LmMKPiBpbmRleCA5MWFhMDE1
NWE0MjAuLmJiNDZkY2JmYjI0ZCAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3Bt
dS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9wbXUuYwo+IEBAIC01MDEsOCArNTAxLDEw
IEBAIGludCBrdm1fcmlzY3ZfdmNwdV9wbXVfZXZlbnRfaW5mbyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZj
cHUsIHVuc2lnbmVkIGxvbmcgc2FkZHJfbG93Cj4gICAgICAgICB9Cj4KPiAgICAgICAgIGVpbmZv
ID0ga3phbGxvYyhzaG1lbV9zaXplLCBHRlBfS0VSTkVMKTsKPiAtICAgICAgIGlmICghZWluZm8p
Cj4gLSAgICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOwo+ICsgICAgICAgaWYgKCFlaW5mbykg
ewo+ICsgICAgICAgICAgICAgICByZXQgPSBTQklfRVJSX0ZBSUxVUkU7Cj4gKyAgICAgICAgICAg
ICAgIGdvdG8gb3V0Owo+ICsgICAgICAgfQo+Cj4gICAgICAgICByZXQgPSBrdm1fdmNwdV9yZWFk
X2d1ZXN0KHZjcHUsIHNobWVtLCBlaW5mbywgc2htZW1fc2l6ZSk7Cj4gICAgICAgICBpZiAocmV0
KSB7Cj4gLS0KPiAyLjQzLjAKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
