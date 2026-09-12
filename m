Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09AA0C88E45
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Sep 2026 07:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o4dL0Q073+3iKeZZgeg0NFNCYGOkaVVzDhTts3YNbjs=; b=mI3uZU070B/Pj1
	D/SsPNYwVNhhrh2/WRA6WJI27UG5y2QSCF8BYRIjkc/Pjz+O52YFPbq1SEeOGKDbqGaIgPM2FiDty
	xcWRdZxZI6hB/lZSqgTi7aZHnn59141rgyRSviudTDNAgPjskCEMUEVGiaoHX+8aZDGf5IdWuYNA7
	XlRPfNFKSHD8TZcGaGTD+RCcHv4b7fROKhj7DLVzZgWa19LS35tq40RlB5GLB1XbdZlpGXgx3r6Dz
	WyeYqQY7DBwodwmjcNNYqu+vkzaxYqqiPwiugtCZDK8NAq+eYA1pvI9y4Ddvj23wuhvIcF6HdIBtk
	mVpnu+PSj0UGHYBbK85w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5I1j-00000000e4N-34dG;
	Sat, 12 Sep 2026 07:19:55 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5I1g-00000000e37-2aod
	for linux-riscv@lists.infradead.org;
	Sat, 12 Sep 2026 07:19:54 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-482f6350faaso116505f8f.0
        for <linux-riscv@lists.infradead.org>; Sat, 12 Sep 2026 00:19:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789197590; cv=none;
        d=google.com; s=arc-20260327;
        b=pDqldn3Vj4B9sTN25155KejfWNLvEHa91W9SZwlJOIJtUmxBap59YPM92NS20jNyMz
         +kbPImfuXNbjfmVly6JZyWj18f+H2lOSNdBEk+MjdDXTxmez7PiPI//8rx7xCA51jLfR
         Ftx5D4ruJGVO0CBpPlTT13XiAMuWW6Wzbpic6+PP1+gQrsUs59MRz91YaoMY8iqUB1Fj
         rr2+qanGFj5JEejcS01hAPsRHCJhvMnOXboc+Swh4vBgbxH0wl+PocP2o34qan34qNA2
         1FGgeed2Qvbx52Uaqg9BcboMRTnRo0mIHa5XYXWzylambfsNriHiFY8N4N38Bq9E0ibw
         Tg4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9RWV49ckuigD55nYwZZoBmV/ryAALoCGfcRf1WteUKA=;
        fh=4D7Do7B18aPwCYqyx7gGOqiEMispu5OTkfEpFzfOnAY=;
        b=p2TPI2S3Y6EBEKjX1xhS32SFSgMv8gy9ldZy2xhJ64cbC7ACLMZkh9oEp5B+YoZVsp
         g8QNT9/JbV286LWE2//eEVsSOGbdxlAkUsHIVKEYwtCIEI3462RDzGvluR1cb41h/rRv
         paMKYmS6VQCAV7Rbj06HivPUI3B3ey5gflX4JUG8sVGdBKFboUFwjJeXfphHyAx7op5e
         RHIu2YJAod6OkHyPdkrKonIzjf1I/WDZXjFGFSfS0V7Mnoon8xboF2o8yWvWmN+e2QZ1
         tUH2k4216WeFdtetMKHDhkCnQjnEfnRrsvF7bEFy9LCmwTCptm9w1ciTgUbcD7TSDPTU
         ljGw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1789197590; x=1789802390; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9RWV49ckuigD55nYwZZoBmV/ryAALoCGfcRf1WteUKA=;
        b=oFMg8gseVHRNRBfhsZG9AwoR40r4Qpvv0wGzzpLXts3iBDYUOu+X6G3DykQ2P+Zt1l
         xXhjjFNINbVcZmqodnsjoT7E2Mz6Kph8TBOf25a+6L1D8OpmaqBv79mDlWbg69l8KPjo
         GJGhDwE7lAThT4S1yAXTRGvgk89439c+H1zbFQaLVq4CHLMCSFtocfOUQRFX5IcFoSUS
         BrvFtyomHBht4/8u8BtLyY+ITiLERtJ/vyNoq7oE1qrJ7+G+KtBSqEikYVh3K8C9O8pf
         vhivMPHMcgZjSWJPwITkz6etdfXDFw5wsNw/UIBMX/9GmW09rg/XVtAj7HQzFHEbXozY
         3rVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789197590; x=1789802390;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9RWV49ckuigD55nYwZZoBmV/ryAALoCGfcRf1WteUKA=;
        b=hKE1GmyqfRj1v3UKZnz+ejwjJUtv9gSab4LmQqYQ9lT9WQcMUEjiZYsFTmmunEbxyD
         0/dx0OfNqkiFBmfuMvem2pWyev5AV18YZ6UbYn5ejBD/EE2b3f83xsW8vHIkcpmWCFlY
         7/IkPF4kiM3BJ9ZsPcg3JfinJiIQB+4/+TtKfsSS8hOLpDJJ+DHIHEppboqtmv7CBEA5
         PPjwExAOihRMH9+p2UkZbxxrGIuFwZLpTHC97mNtl9DqvOyuzOKFX0pWsiG96+wpnDb2
         s8854bSwRoj9+NLqfblTJGLlazY8T5mwNZRwF7AAVPWYJsMZHOO0O+EyYnSFG6Temc/l
         ICKQ==
X-Forwarded-Encrypted: i=1; AKwUvBz4bcsa2iXHOyuc+riuUrhyDn37ESHE0CPxwKYbFpTOvXk8tZ/qf7suGBXN6a/A6eUgI71va/AOI+HitQ==@lists.infradead.org
X-Gm-Message-State: AFuF++moLP9QKgOya0eo/oMOsxHB3/fiGkCHA62fmOfLYRv6py6ZZKgp
	R6VNBhG4ix5cYu8jXXDTvJ9D1giX8R9JsGejStfBkHh6GtAgCe1dZjL+XEmy1MRdTATnM2SoABm
	1zzAcv/l+do58pq6NxtflxrZ5zUN4PIJOpn8aNjx04Q==
X-Gm-Gg: AYBFou3EWtCNgeZo4Rn9Ki4ZlHZpP/n1bLecPwp6mGorpElzdcPFVIHrJUz2obbXt9A
	LHyMTdRwiETGsu8gDNltxBmCv735FFCpve+786bl19Krx3O9BuVvoRs2vSrv9UCmgk4vTxBOiNA
	xToNnNT4Nn4esmSi4KMMQ6P2i34TgJe8rBfrtYiBj0W3M0XssH5wNfug638qz3d6xqGollmr5v8
	4aX4qk0Q3Wdu3vXSMooBcR+1OEILTJXULp9kwAnKGphFxFLs1WfoJzMWu9TxitE3OTfm0nSP09I
	Pcb5MKenxzyBNw2Tl594BjE4k6v3rwt6OP0Jt/JbBuIeJ2LvcHTjymhP5N4njmrcVQudQqklyp2
	rXqoXqRyvmGCTFzh3sMowdUsQBGF+BMjgUaB5FCfSrGPL2P9dDfJKcaH7rfWBvKPhcZabozLxd1
	Q=
X-Received: by 2002:a05:6000:702:b0:486:f600:8e6b with SMTP id
 ffacd0b85a97d-486f6be9493mr1750445f8f.14.1789197589863; Sat, 12 Sep 2026
 00:19:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260826064117.58029-1-min_halo@163.com>
In-Reply-To: <20260826064117.58029-1-min_halo@163.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 12 Sep 2026 12:49:37 +0530
X-Gm-Features: AcwNN1WADS_UyMRbl-o6HEs2JIz2PBNtpUz7lA9SsGRbmoy5E-S50JL4uCJxHNQ
Message-ID: <CAAhSdy1AugX4AiU6xj1R3SQ9bRsRFBNu6=_aYM=G9SMkXN8Ghg@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Fix sdata leak and stale snapshot_addr in snapshot_set_shmem
To: Zongmin Zhou <min_halo@163.com>
Cc: atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, ajones@ventanamicro.com, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Zongmin Zhou <zhouzongmin@kylinos.cn>, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_001952_675420_C63E118E 
X-CRM114-Status: GOOD (  19.50  )
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

T24gV2VkLCBBdWcgMjYsIDIwMjYgYXQgMTI6MTHigK9QTSBab25nbWluIFpob3UgPG1pbl9oYWxv
QDE2My5jb20+IHdyb3RlOgo+Cj4gRnJvbTogWm9uZ21pbiBaaG91IDx6aG91em9uZ21pbkBreWxp
bm9zLmNuPgo+Cj4gQSBndWVzdCBtYXkgY2FsbCBTQklfUE1VX1NOQVBTSE9UX1NFVF9TSE1FTSBy
ZXBlYXRlZGx5LiBFYWNoIGNhbGwKPiBvdmVyd3JpdGVzIGt2cG11LT5zZGF0YSB3aXRob3V0IGZy
ZWVpbmcgdGhlIG9sZCBidWZmZXIgKG1lbW9yeSBsZWFrKSwKPiBhbmQgaWYgYSBsYXRlciBrdm1f
dmNwdV93cml0ZV9ndWVzdCgpIGZhaWxzLCB0aGUgZXJyb3IgcGF0aCBmcmVlcwo+IHNkYXRhIGJ1
dCBsZWF2ZXMgc25hcHNob3RfYWRkciBzdGFsZS4gQSBzdWJzZXF1ZW50Cj4gU0JJX1BNVV9DT1VO
VEVSX1NUQVJUIHRoZW4gcGFzc2VzIHRoZSBJTlZBTElEX0dQQSBjaGVjayBhbmQgY3Jhc2hlcwo+
IHRoZSBob3N0IHdpdGggYSBOVUxMIGJ1ZmZlciBpbiBrdm1fdmNwdV9yZWFkX2d1ZXN0KCkuCj4K
PiBGaXggdGhpcyBieSBjbGVhcmluZyB0aGUgcHJldmlvdXNseSBpbnN0YWxsZWQgc25hcHNob3Qg
YXJlYSBiZWZvcmUKPiBpbnN0YWxsaW5nIGEgbmV3IG9uZSwgd2hpY2gga2VlcHMgc2RhdGEgYW5k
IHNuYXBzaG90X2FkZHIgY29uc2lzdGVudC4KPiBUaGUgU0JJIHNwZWMgc3VnZ2VzdHMgYSBzaW5n
bGUgaW52b2NhdGlvbiBidXQgZGVmaW5lcyBubyBlcnJvciBjb2RlCj4gZm9yIHJlcGVhdGVkIGNh
bGxzLCBzbyBLVk0gbXVzdCB0b2xlcmF0ZSB0aGVtLgo+Cj4gRml4ZXM6IGMyZjQxZGRiY2RkNzU2
ICgiUklTQy1WOiBLVk06IEltcGxlbWVudCBTQkkgUE1VIFNuYXBzaG90IGZlYXR1cmUiKQo+IENj
OiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4gU2lnbmVkLW9mZi1ieTogWm9uZ21pbiBaaG91IDx6
aG91em9uZ21pbkBreWxpbm9zLmNuPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxh
bnVwQGJyYWluZmF1bHQub3JnPgoKUXVldWVkIHRoaXMgcGF0Y2ggYXMgZml4IGZvciBMaW51eC03
LjMtcmNYCgpUaGFua3MsCkFudXAKCgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3BtdS5j
IHwgOCArKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCj4KPiBkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9wbXUuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVf
cG11LmMKPiBpbmRleCA3NTJmMTAxNGQ2MzNlN2Q2N2Y2OWMyN2I3MjA4OGVkNTYwYzE4N2FjLi4x
NGY3MzQ5MGYxMmNiYzVhODU0Nzg1OWYwZDFiYjExNzBkODk0MDNiIDEwMDY0NAo+IC0tLSBhL2Fy
Y2gvcmlzY3Yva3ZtL3ZjcHVfcG11LmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3BtdS5j
Cj4gQEAgLTQ1NCw2ICs0NTQsMTQgQEAgaW50IGt2bV9yaXNjdl92Y3B1X3BtdV9zbmFwc2hvdF9z
ZXRfc2htZW0oc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB1bnNpZ25lZCBsb25nIHMKPiAgICAgICAg
ICAgICAgICAgfQo+ICAgICAgICAgfQo+Cj4gKyAgICAgICAvKgo+ICsgICAgICAgICogQ2xlYXIg
YW55IHByZXZpb3VzbHkgaW5zdGFsbGVkIHNuYXBzaG90IGFyZWEgdG8gYXZvaWQgbGVha2luZwo+
ICsgICAgICAgICogdGhlIG9sZCBzZGF0YSBhbmQgdG8ga2VlcCBzZGF0YS9zbmFwc2hvdF9hZGRy
IGNvbnNpc3RlbnQgaWYKPiArICAgICAgICAqIHRoZSByZS1pbnN0YWxsIGZhaWxzIGJlbG93Lgo+
ICsgICAgICAgICovCj4gKyAgICAgICBpZiAoa3ZwbXUtPnNuYXBzaG90X2FkZHIgIT0gSU5WQUxJ
RF9HUEEpCj4gKyAgICAgICAgICAgICAgIGt2bV9wbXVfY2xlYXJfc25hcHNob3RfYXJlYSh2Y3B1
KTsKPiArCj4gICAgICAgICBrdnBtdS0+c2RhdGEgPSBremFsbG9jKHNuYXBzaG90X2FyZWFfc2l6
ZSwgR0ZQX0FUT01JQyB8IF9fR0ZQX0FDQ09VTlQpOwo+ICAgICAgICAgaWYgKCFrdnBtdS0+c2Rh
dGEpIHsKPiAgICAgICAgICAgICAgICAgc2JpcmV0ID0gU0JJX0VSUl9GQUlMVVJFOwo+IC0tCj4g
Mi4zNC4xCj4KPgo+IE5vIHZpcnVzIGZvdW5kCj4gICAgICAgICAgICAgICAgIENoZWNrZWQgYnkg
SGlsbHN0b25lIE5ldHdvcmsgQW50aVZpcnVzCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
