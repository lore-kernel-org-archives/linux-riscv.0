Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A87D5F3D5E8
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Mar 2026 08:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bwVx2xobYsoA+ah9/vxH0rRe9lL6tcZzi7au7ROVtLs=; b=YszVkept0qNtnG
	QP+EaaNvY/hBIsM9HN0KqFxybUWdfzUN2S6901CUM+hRU9+Q0TAypbg3T8x2HiOwjVY2VlPj5XboN
	up/g3Qz/b8IfRcKguFcIQym0AlL2Q0I8zYVYrTkhdlbpYhZA2TdoRNqa5S9d2OqVkJ/N7PreVZIWg
	UKO0otLsCFb3v+jyJ/VQU2k2LSsx5uaBYRReTsv8NUhnViqkki2MsYMWXW9jMAj7BhFvDhiXrgKqK
	laTPZch9VnTQY296wt4Y6585QkOCTRJwDVMVd/8cmQrF6/nT1wtc20RZeexnXACm7fcwBmvjuUBRG
	qwHTHqa+i8AmFWD7IgPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w77xT-0000000AqtB-2Fu3;
	Mon, 30 Mar 2026 08:26:51 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w77xQ-0000000Aqrr-3Jxk
	for linux-riscv@lists.infradead.org;
	Mon, 30 Mar 2026 08:26:50 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-7d77b179b52so4141742a34.2
        for <linux-riscv@lists.infradead.org>; Mon, 30 Mar 2026 01:26:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774859207; cv=none;
        d=google.com; s=arc-20240605;
        b=YteRts/clHpI1yqydub+7CT1Egxi8AqML8HZgmW93NRknfwYl3OuHx+xyJHMLd6sBL
         UYCoNgKqFycb+8ko5Kd4WDhrU0Tuz3g3pea1SWzTmYGPJv69CsYs79mxvhXkxsc0doJK
         PA2m1fSKZcOp5UyLuJ0c9IiNlsI2Q2kpNjYSDO102nV315SgEpJ//3OlQRHUvu8lMwYW
         gwIM92ZHCeeP3vkcMN7g6n+A/EBCKn2XkDwyVnmGHOdYn4QpzpvhZcO1YlYj22AcoVeZ
         /VF7cFRbEPjleQdBqv/nb7cfU8FgC7JBItGDHKoEK7+L6r6hBchlBKf0EvO2L/6Bi6a5
         zXHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/gohPRZM3Pl5gGZYd1SEWk3NT0Z9V00jCIRMY1+DdSI=;
        fh=k8/4i5wLDMQhkGjvOIaRRWjeh/fl3GeLrtGDSfB8Zm8=;
        b=Vdps2Qbkkw08u7clNF/QB+sAB+oEISrLykHKIbwGR574rq9qluu9mcLspJB/DDowCY
         e4U/VgIoidDQooAOY9czZTGcLQNY6fB6PAVnAAIMz69gC/U/SALl81H1R6FQbEBcD8Bj
         8ZrikIFlDjttfRzHu4kZQCGnDPCVlgDgUotL4jR/RvOcbnUTZWpeHgB+NJmRn3dHImKk
         jClUAPCmlOLb6t3i5XQZpElnFPhYxn4hmGm6uE2jSBSX/WRwsvD/WhyS5kUCYYqZnG+H
         BQwHlUWwiNE6XTFhwnyQ03FzjMTO+a5uhjGZKUnJCPpQ/l/3ikCsLvCU2qSiCtBhXw2n
         kyzw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1774859207; x=1775464007; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/gohPRZM3Pl5gGZYd1SEWk3NT0Z9V00jCIRMY1+DdSI=;
        b=za+l8NJxRhjUhlXsjU6SQKuFzlb1gOXmSl8BEwMqIt9kRIXFa7thdYhNfvzFKpn9+b
         Cu21xFAPoCZhkxNYOwMYnZesCxBBo/perGZ+OTR0nUQbS3DaE+5rGll7eRURRcJfolQD
         4OXCEIgtlljEW6O4ar38r9OwbxlcoLb0q/Hbih73oVsJJyIYC5ZUaQYD0qKYIlCr1XAz
         v0YHvd0kD0m85Iucvx9GzX+vlLfU6ds3tGoGazXxIelsRLLU+SlETY9hQ+WUpH/LNmQJ
         0boofR92D/JPnBcE3l98FDgjCRtgdGdjTO15KX4dFlKfxDk1fDizaA0AP6jL4ObmNyDG
         kKRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774859207; x=1775464007;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/gohPRZM3Pl5gGZYd1SEWk3NT0Z9V00jCIRMY1+DdSI=;
        b=Z7CUhOEaFnmZQYXT/ieKz8YF8K6xDBlIerFCBlO+v0VjtLKGGc0Pm+ddEB7jaOjEEn
         mQi11jkLbGasKJdcp5Nfn3ibpet/2I95p/uU8b8S90vq/tnGJLTC5GZG3tNPPvnJKy6U
         ah7AMWQbHegTzR1KqqzHsQ5ecfOx2SLS7lFjW2z5F68vicqzVSyhmeKO4/qAHCZvs8Y6
         TwD3082C4IQtYkUSg1PLuQ7ObGIhxl5nQMcfdTNiCsbooQIh7WC+wpRPV4hlUhz8Mi4C
         b4zLQgbPeOUQ0cT/MyQ1yJ1CjGJqY6ue0CvjoMAdTINCvymj1t/MwP2a46MFFiZvVwPz
         IIJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbPufdiLtl0P1jgEIzPPr40gr+Hkod+DN7qT2Xg/WKMmFlhcRz/DwKmHFSaCpDqdYUZbgtkfzh6+ITxg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyP4FSRz0JMrLcjc8DX+oAQle9I8GFCF6cnN+HPVVRFy11h8bgj
	+jtfch8bOe4q5JaaApGuzE37LrIPtpyX3UVyDT4f0DGQV/4irHOThlYEJPHjCMVH0JF8Bi2C38v
	BkIoXibUo67Wc2jWl3O4C6yjsohTyab1537dwWvVmWA==
X-Gm-Gg: ATEYQzwoRFNiWjP2ao/43FRJUTHfIQhHQb4wkIJzqWXw7kdB4Ia84hRhWt6qkLlv29c
	emDX5siYdRXr1n70bCYxyzBa/yf8m6lp6dBr2iPxpp/nRmPkK10Q0He16a3daX2jwt+ZgwLkGU1
	++zPiEATI7WD09eV6upsTl14rnYcdargN0PJa3LnI74xd+v3oHLr79p/MI39NB2ALD60Icc8/DJ
	rrD9UMV9Ki9K0ney8YlcygtrK7x0Tmya3T9HD8X4lw65UwW685Pj38WRd4QbNUckTdYBVnlbC7u
	k/QD43cvFUZKSZTtHXojYpjYgN1/2FTpSCjhnJpJcqo8jnYswnKAcQit2V3KTU0QFW8PpibXlgq
	jCIoGgoLV0J1GfadOePoi+VxRAg==
X-Received: by 2002:a05:6820:f02f:b0:67e:2013:aa49 with SMTP id
 006d021491bc7-67e2013ab10mr5470274eaf.61.1774859207468; Mon, 30 Mar 2026
 01:26:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260317114759.53165-1-r4o5m6e8o@163.com>
In-Reply-To: <20260317114759.53165-1-r4o5m6e8o@163.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 30 Mar 2026 13:56:36 +0530
X-Gm-Features: AQROBzBNAoeEH4dtJiurCDIIFIldpeiaCAUkebJle2PJfQjHD7l832yD7YxCj4E
Message-ID: <CAAhSdy21XejojvdgkYdqO-40iF9AfN6k1Nx8X0PSpmF2D6_GzQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: kvm: add null pointer check for vector datap
To: "rom.wang" <r4o5m6e8o@163.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Yufeng Wang <wangyufeng@kylinos.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_012648_982130_20B9FC56 
X-CRM114-Status: GOOD (  15.61  )
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

T24gVHVlLCBNYXIgMTcsIDIwMjYgYXQgNToxOOKAr1BNIHJvbS53YW5nIDxyNG81bTZlOG9AMTYz
LmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBZdWZlbmcgV2FuZyA8d2FuZ3l1ZmVuZ0BreWxpbm9zLmNu
Pgo+Cj4gQWRkIFdBUk5fT04gY2hlY2sgYmVmb3JlIGFjY2Vzc2luZyBjbnR4LT52ZWN0b3IuZGF0
YXAgaW4KPiBrdm1fcmlzY3ZfdmNwdV92cmVnX2FkZHIoKSB0byBkZXRlY3QgcG90ZW50aWFsIG51
bGwgcG9pbnRlcgo+IGRlcmVmZXJlbmNlcyBlYXJseSwgY29uc2lzdGVudCB3aXRoIHRoZSBwYXR0
ZXJuIHVzZWQgaW4KPiBrdm1fcmlzY3ZfdmNwdV92ZWN0b3JfcmVzZXQoKS4KPgo+IFRoaXMgaGVs
cHMgY2F0Y2ggaW5pdGlhbGl6YXRpb24gaXNzdWVzIHdoZXJlIHZlY3RvciBjb250ZXh0Cj4gYWxs
b2NhdGlvbiBtYXkgaGF2ZSBmYWlsZWQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBZdWZlbmcgV2FuZyA8
d2FuZ3l1ZmVuZ0BreWxpbm9zLmNuPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxh
bnVwQGJyYWluZmF1bHQub3JnPgoKUXVldWVkIHRoaXMgcGF0Y2ggZm9yIExpbnV4LTcuMQoKVGhh
bmtzLApBbnVwCgoKPiAtLS0KPiAgYXJjaC9yaXNjdi9rdm0vdmNwdV92ZWN0b3IuYyB8IDEgKwo+
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L2t2bS92Y3B1X3ZlY3Rvci5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV92ZWN0b3IuYwo+IGlu
ZGV4IDQ2ZmJmNDhmMjUwMy4uZTk4OWNiOWYxYWM0IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yv
a3ZtL3ZjcHVfdmVjdG9yLmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3ZlY3Rvci5jCj4g
QEAgLTEyOSw2ICsxMjksNyBAQCBzdGF0aWMgaW50IGt2bV9yaXNjdl92Y3B1X3ZyZWdfYWRkcihz
dHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCj4gICAgICAgICB9IGVsc2UgaWYgKHJlZ19udW0gPD0gS1ZN
X1JFR19SSVNDVl9WRUNUT1JfUkVHKDMxKSkgewo+ICAgICAgICAgICAgICAgICBpZiAocmVnX3Np
emUgIT0gdmxlbmIpCj4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4g
KyAgICAgICAgICAgICAgIFdBUk5fT04oIWNudHgtPnZlY3Rvci5kYXRhcCk7Cj4gICAgICAgICAg
ICAgICAgICpyZWdfYWRkciA9IGNudHgtPnZlY3Rvci5kYXRhcCArCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIChyZWdfbnVtIC0gS1ZNX1JFR19SSVNDVl9WRUNUT1JfUkVHKDApKSAqIHZs
ZW5iOwo+ICAgICAgICAgfSBlbHNlIHsKPiAtLQo+IDIuMzQuMQo+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
