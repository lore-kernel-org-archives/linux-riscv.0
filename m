Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CAEFEBFD01
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Apr 2026 06:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2T7oVxuhH4EVmg6PMxuaP4Z+FsR1dnNjQt99YNVTFqM=; b=m987MQQlaNO0Dz
	QENY54gHL0T50CxoAJhHG+V9QrDL4jXSapLkY+4CdQMrpP9VpWSdAHL2sg5cF0V1LEZW6g/RrInRN
	itq2NY9gLMBdmx/Er8wC8nb17rAyL7PDv/xB3eYY076gMX1d95SSMae1cGUUZ2q6dIqKsnO38dYUn
	COzjyCzXgSDHK1P0B3XTAZqxATNt9Bx6HTvHhMnAv+c+crJi5nBuC88y3shpb5X6zQ2TbWf+nCtHx
	kZ/N5q1ogQtJ8Vk3u9aYhVYzin3IfRyhHR3CDho2xH1f4tGmrun4Tf3w7UdTsl5XELa4fmZuhWPuM
	1AcAwtJyhFcQ9fcCmRNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCAtC-0000000F57q-3NhP;
	Mon, 13 Apr 2026 06:35:18 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCAtA-0000000F57D-3HfR
	for linux-riscv@lists.infradead.org;
	Mon, 13 Apr 2026 06:35:18 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-66ee7b9af94so1362563eaf.0
        for <linux-riscv@lists.infradead.org>; Sun, 12 Apr 2026 23:35:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776062115; cv=none;
        d=google.com; s=arc-20240605;
        b=XQ0HqaDym/bBLr1NO2b64xchYkLDWoASFn/AQYdjv+di2lrCSS90lGIxQIxPd8W26H
         RwqaJIlgLRgc5eDWa8IQZvAopY3UQkmk157XzHaY2Dl4A0wV1JEQ6Exy6obsKNksl+3F
         xpW80yt52J8sLbnk0D2Xpk2ElGRrkjm/II5dyHKHphl6QsXn4JlsUVKRIY5oTFSMBeme
         QeLb+di8bdBJfW/tuyHTNjvPx8czNDqGigK7Pr2L+txeQ+8bWbrH0JIszwYd8EtOhX6A
         7E+FpsEzaw6Xj8PI5ka/cMSvaDqGKrQBcIP16YefvNnAqGsVev2Mu3zfQNGU9NV7cxs9
         LeDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IhmEYjR6/quzdnxRuC7TxxzEx+eEg6dd48C0268iWf4=;
        fh=OWvZE40+l5DJgOCjLN58QlStx7LnB60kSfgDMIG9k2c=;
        b=MitNh9mzLry79ERodoTorY0j8lVur4eNmPUGEzMMYmJIpnaNNTtTbZGSi+7s0hIJpD
         11LbO0y6y8ecQETDMUUyGdHJ3S56p/PzGvgS6254zZg5sEcDIA1NHAr6dkZ7TuzDMryA
         kK7Zv5udr4WehLHwwet0ZMNM/bwHVpvyOxhxsL31uZ+Kombg0RNGlzoFR7gXLE64WFey
         X5aJL8Q/zYSd1Oyo7/9TGOO63ungUefzppzVECrFutrWYE9S9xPN5m47NaRNWm32vhCA
         ac+SHnJfS/LZWGw6r/OeDLo9IvwT5WGU6XWHGURBsKOKHutgfuBDDEHYBlPaWClNO0ds
         Uvmw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1776062115; x=1776666915; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IhmEYjR6/quzdnxRuC7TxxzEx+eEg6dd48C0268iWf4=;
        b=BMaJSD0TrsA8ygTRbWRcM/5QwNme4Qr/sKVWETsZTf6FpAaSxXKlbUK4Z0HlpTlpI1
         gcHhdCECU8YOO6MuuZTHDsupktoXAirbgi5XBW47agyPRqBimcCwp7oXCKasbEE8iNsQ
         OtO04lZpPZFeBEkcul1nte0gstCpGz+jKYhxN2DxpbSYT/0Oh4H+BSt0YvTbO4tAM30w
         1nc0cRlwJpWI6ikyRdFfrmuLhQCX3BvTQe35E2giLix427uh1aD2CtyvF1IYMYVRAoVI
         5lKKIofkqOv5OH9hfctsd/zz+A7/ljkHaGYJhHxmyPGvNIFjojzjGVwosTkvzY65MNPs
         v1ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776062115; x=1776666915;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IhmEYjR6/quzdnxRuC7TxxzEx+eEg6dd48C0268iWf4=;
        b=Z3RCvnfPtzI+vmGZ08/rYM2WuSIbpzmHQLj6U1Usjqf7vj0+txySPJHhAEv3tQe+tl
         on5eScUC0U6qoOUBa0Y9eQZdx9vS3SYHTtS4tpngBbfNTPaIY+pHNx3OsBXhJ8GR8ilx
         5pRfvgHUI5C4IjxFk7vv/H2hOF66FH0fbRmUFKXGyleMyji0lyTwn2CrEEi0hAthOXdl
         ymRzHBVOwrzJCaFAciza0osDM/Yb8B6gYUOiLILU471g5+1PJ/hUAKtSqhr+Rvrq+h9e
         oEIQ4DpPOMQstKdc27fj5zlElEDummMISFreYpfJvz2bS5UVneW3lJ0xnodtxcbWPSfq
         dK+w==
X-Forwarded-Encrypted: i=1; AJvYcCVaTlPOIUyYU04q/B5KZZ8zXd3ksMnY5oay9HFd0+B3kLYm+QCD8xySgdxuho2TxPgrI9faUDFPRADnBg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzMjiA1dOdx2yEMTn8RDFoA0kr+EyAIPkQ+TvmQtTVQY6zfJaiD
	OC18bshw9KXPfPIQ18gq6pNnM1ld6h3ug0tup1AUM64y+jBIc2lLP4YyMLhSS8Mvdqk+tUi2O/K
	jPrh8pbFH8BLvN1qWO9GefvBsrmHeE1fvaexEOm5YnA==
X-Gm-Gg: AeBDievDlnDEj8OjJfXrqeaK7AaPjrBvOxjNco47P/QGTBaziQPhr5F7OjW8SACgge4
	jO7vANNoAkMEH6jC8m3m6pJ95Sb3Bwy8Rpml8bcGhVpa+EQ9E1qWwPOJXTHddL5d0AmZHHpy82V
	xnQ4Xif2+A+SUR7YivHsckCaajNK8jKEYzDUdVQwH7ZL1TncKZx1dXEs1JrOA3zO0y9pgilUs9f
	1yoW/qIU2SGVHZD3DKxxpcm1VZzQtmwgMw+5U/T6mX3i1ojIqnITup9+1CoNfag8W+2mb0CuTRo
	S+RA7Apq3IQNsFD+59ZnCKwH7q/bbnHsq9HsGDWw6GfRpF38+kUtry8Jw7dTwJjc7zqCxeErEdb
	30WuRAKLsJYQ6xDMk4kbwj7MIEOfynXLvlss4
X-Received: by 2002:a05:6820:1843:b0:67e:aa1:8825 with SMTP id
 006d021491bc7-68be7ee694fmr5678237eaf.35.1776062114774; Sun, 12 Apr 2026
 23:35:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260413054439.1715082-1-mikey@neuling.org>
In-Reply-To: <20260413054439.1715082-1-mikey@neuling.org>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 13 Apr 2026 12:05:03 +0530
X-Gm-Features: AQROBzCcl-LJ0nMVT4pylFo0k7IEEc2v2cILLcr4BVOVjWfJLHs-ruU1CPsIK8A
Message-ID: <CAAhSdy1AG8N3iGJ9FLK+JPurnDv24ABP0LNhvx19ig1WHo8FxQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: KVM: Fix memory leak in vector context allocation
To: Michael Neuling <mikey@neuling.org>
Cc: atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, kvm@vger.kernel.org, 
	vincent.chen@sifive.com, greentime.hu@sifive.com, andy.chiu@sifive.com, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_233517_092209_5258D75C 
X-CRM114-Status: GOOD (  18.86  )
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

T24gTW9uLCBBcHIgMTMsIDIwMjYgYXQgMTE6MTTigK9BTSBNaWNoYWVsIE5ldWxpbmcgPG1pa2V5
QG5ldWxpbmcub3JnPiB3cm90ZToKPgo+IFdoZW4gdGhlIHNlY29uZCBremFsbG9jKCkgZm9yIGhv
c3RfY29udGV4dCB2ZWN0b3IgZGF0YSBmYWlscywKPiB0aGUgYWxyZWFkeS1hbGxvY2F0ZWQgZ3Vl
c3RfY29udGV4dCB2ZWN0b3IgZGF0YSBpcyBub3QgZnJlZWQsCj4gY2F1c2luZyBhIG1lbW9yeSBs
ZWFrLiBUaGlzIGlzIHRyaWdnZXJhYmxlIGZyb20gdXNlcnNwYWNlIHZpYToKPgo+ICAgaW9jdGwo
dm1fZmQsIEtWTV9DUkVBVEVfVkNQVSkKPiAgICAg4oaSIGt2bV92bV9pb2N0bF9jcmVhdGVfdmNw
dSgpCj4gICAgICAg4oaSIGt2bV9hcmNoX3ZjcHVfY3JlYXRlKCkKPiAgICAgICAgIOKGkiBrdm1f
cmlzY3ZfdmNwdV9hbGxvY192ZWN0b3JfY29udGV4dCgpCj4KPiBOb3RlIGFsc28gdGhhdCBrdm1f
dm1faW9jdGxfY3JlYXRlX3ZjcHUoKSBkb2VzIG5vdCBjYWxsCj4ga3ZtX2FyY2hfdmNwdV9kZXN0
cm95KCkgb24ga3ZtX2FyY2hfdmNwdV9jcmVhdGUoKSBmYWlsdXJlOgo+Cj4gICBrdm1fYXJjaF92
Y3B1X2NyZWF0ZSgpICAgICAgICAgICDihpAgZmFpbHMsIHJldHVybnMgZXJyb3IKPiAgICAgICBn
b3RvIHZjcHVfZnJlZV9ydW5fcGFnZTsgICAgIOKGkCBsaW5lIDQyMDkKPgo+ICAgLi4uCj4gICBh
cmNoX3ZjcHVfZGVzdHJveTogICAgICAgICAgICAgICDihpAgU0tJUFBFRAo+ICAgICAgIGt2bV9h
cmNoX3ZjcHVfZGVzdHJveSh2Y3B1KTsg4oaQIHdoaWNoIHdvdWxkIGNhbGwgZnJlZV92ZWN0b3Jf
Y29udGV4dAo+ICAgdmNwdV9mcmVlX3J1bl9wYWdlOiAgICAgICAgICAgICAg4oaQIGxhbmRzIEhF
UkUsIGJlbG93IGFyY2hfdmNwdV9kZXN0cm95Cj4gICAgICAgZnJlZV9wYWdlKHZjcHUtPnJ1bik7
Cj4gICB2Y3B1X2ZyZWU6Cj4gICAgICAga21lbV9jYWNoZV9mcmVlKHZjcHUpOwo+Cj4gc28ga3Zt
X3Jpc2N2X3ZjcHVfZnJlZV92ZWN0b3JfY29udGV4dCgpIGlzIG5ldmVyIGNhbGxlZCB0bwo+IGNs
ZWFuIHVwIHRoZSBwYXJ0aWFsIGFsbG9jYXRpb24uCj4KPiBGaXhlczogMGY0YjgyNTc5NzE2ICgi
UklTQy1WOiBLVk06IEFkZCB2ZWN0b3IgbGF6eSBzYXZlL3Jlc3RvcmUgc3VwcG9ydCIpCj4gQXNz
aXN0ZWQtQnk6IENsYXVkZSBPcHVzIDQuNiAoMU0gY29udGV4dCkKPiBTaWduZWQtb2ZmLWJ5OiBN
aWNoYWVsIE5ldWxpbmcgPG1pa2V5QG5ldWxpbmcub3JnPgoKQSBzaW1pbGFyIGZpeCBpcyBhbHJl
YWR5IG1lcmdlZCBmb3IgTGludXgtNy4xCihSZWZlciwgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
YWxsLzIwMjYwMzE2MTUxNjEyLjEzMzA1LTEtb3NhbWEuYWJkZWxrYWRlckBnbWFpbC5jb20vKQoK
UmVnYXJkcywKQW51cAoKPiAtLS0KPiAgYXJjaC9yaXNjdi9rdm0vdmNwdV92ZWN0b3IuYyB8IDQg
KysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4K
PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV92ZWN0b3IuYyBiL2FyY2gvcmlzY3Yv
a3ZtL3ZjcHVfdmVjdG9yLmMKPiBpbmRleCAwNWYzY2MyZDhlLi40NmZiZjQ4ZjI1IDEwMDY0NAo+
IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfdmVjdG9yLmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2
bS92Y3B1X3ZlY3Rvci5jCj4gQEAgLTgwLDggKzgwLDEwIEBAIGludCBrdm1fcmlzY3ZfdmNwdV9h
bGxvY192ZWN0b3JfY29udGV4dChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4gICAgICAgICAgICAg
ICAgIHJldHVybiAtRU5PTUVNOwo+Cj4gICAgICAgICB2Y3B1LT5hcmNoLmhvc3RfY29udGV4dC52
ZWN0b3IuZGF0YXAgPSBremFsbG9jKHJpc2N2X3ZfdnNpemUsIEdGUF9LRVJORUwpOwo+IC0gICAg
ICAgaWYgKCF2Y3B1LT5hcmNoLmhvc3RfY29udGV4dC52ZWN0b3IuZGF0YXApCj4gKyAgICAgICBp
ZiAoIXZjcHUtPmFyY2guaG9zdF9jb250ZXh0LnZlY3Rvci5kYXRhcCkgewo+ICsgICAgICAgICAg
ICAgICBrZnJlZSh2Y3B1LT5hcmNoLmd1ZXN0X2NvbnRleHQudmVjdG9yLmRhdGFwKTsKPiAgICAg
ICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07Cj4gKyAgICAgICB9Cj4KPiAgICAgICAgIHJldHVy
biAwOwo+ICB9Cj4gLS0KPiAyLjQzLjAKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
