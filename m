Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FBD7109B463
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Mar 2026 13:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FGnXC/1gh9C9rGMY/qe5CXQ1B1MfOuUCAh4eD9um0V0=; b=LCn72XIDE1QZKS
	I5+kgaAdQFyDuF34DpgDYuBKTZEDspjiduWtexg4Sm9o5BXoqBEn037R+Apah6FlKh/LklmrNXW4E
	7gaiJUONdrRkPwwKwQy2A9wKEjQiXXslEHnenAtZosKGM5OIeOx1vt8oI4MsL/1aJkM/8iIiRxKVP
	IpmCfJR0n8Xb3ZvZhc3w1gnJ/m0+ZxyNXMjGj+uxhL1hlAwaum8aUa6FgiITotRarTEbhbjxJMrGU
	Iy1IbMYP1Q0HTllspGek1EE8Yd2P+Io1KihUrDoU0e7qZon/89CmRl1oydVYNrMfQ2tq8QEtPLXYM
	0lM5AEqDc27EILMNauhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Yld-0000000CygA-2Odf;
	Tue, 31 Mar 2026 13:04:25 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Yla-0000000CyfI-1qe6
	for linux-riscv@lists.infradead.org;
	Tue, 31 Mar 2026 13:04:23 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-b980c65b97aso841317166b.0
        for <linux-riscv@lists.infradead.org>; Tue, 31 Mar 2026 06:04:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774962260; cv=none;
        d=google.com; s=arc-20240605;
        b=eCCo51kf03kXB2SrDo6udNEiH7JdY/MHawU5DjI90aRF0i8O1pdEVUIc6mUt2ZJPyh
         EosMrdNsZsZUTfilQuVsiv2z+aZ362b1q6hnIK/VWYqTj3wzm88k00BHJI59u0GiP7CE
         ntS59ZXtgNNfdxtZdf+G4v1jlu6WRfo2AbtL7d/rPO59x/pOXHet7+/+T9ErI4bHwrJn
         /nAbUePRLshBudlPI7xdnstLiKS+pLJ2pP+e/WkKC5iSpUxgIdiX/twYSoBd2/tDmeGf
         Q/nxO92rT1UMIRDS7hgSVemL6Lt0jmRMvEyPaVVla74sBiFiiVFCxXDrwcrwyQvz+rrY
         08dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ecvm3yTkU0AMe9t2ouHPkvyA6VqwLu70kRxdHhHfCas=;
        fh=iI55NoEyq+PdW0H8tHuf72JRkys4xhnPUDIG9VfJurg=;
        b=Ow4VuwzAy/gI7Aefy9sv9jx8YXZWcwxR5e+jYGHPDZAyoBgcyUjsGedBnW3ppUu3SB
         QIFpqongAkWKObIfRFI2BHrETtjLoLhL8bMTbJ1+8v0xBpdlFM6aEIrwn+D9k4QR5cH4
         LHUOJcThMn7RQiFUWY/wuF+FssxVxbaEZWlU9fyqfM5QtZm7j+wgtPXFpKBmDOqdnhCC
         KHdATZjPGC/YW8inCaWqp7LIsZXFhbsffwfHeuOHsOEVx6bXRO9GClslghuc0Wsgq5ig
         LFOkkad+lgV4P1NMALFfxY3Hfs1FjVlipucmLBUW5a7CSaJ8pHEMvxDH+5haa5CA5IqY
         07NQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774962260; x=1775567060; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ecvm3yTkU0AMe9t2ouHPkvyA6VqwLu70kRxdHhHfCas=;
        b=rYvFik1ntUbe1C4N2RNoY5pXQyL6CjPyoct5Ke1Uzf+V0gTHNabjqR3ufjmAVhcTfJ
         zfO6kMOgp639zQicq8sB2jvKq0Vmhrs00PCVbztgHHCBU17kEZoMJEEU2yqS1CBQwemA
         VIHLncXr/bC7NGoYZJPnj8gzM6CV7FS1ZjFTbMVvIxdE5QG+z2qeW7XsH+iay5aSgqu3
         bREzXj7OLpeWU+zpnC3WbKZnsrYmLZBdLmScySShUcEgO2CcTZ6tTT84ZahUZa2rUHHo
         hQnaAKpNSFnNhu2mOcHqUaKC0TzkUt13lZS6THbQTGTEOb1fLsQ0Zrbt4u2w+NHgKWwn
         3GGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774962260; x=1775567060;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ecvm3yTkU0AMe9t2ouHPkvyA6VqwLu70kRxdHhHfCas=;
        b=gC1JUyAFT/tjPjDe/C5D7VKhh1Z7pQjUqa63Mn74G9Qiff3KgPTukUFwJsZr2Wc93C
         LfF8a6w8OkOZQ0D/GQRPm1km/IooP3s10yNhGCl5B8ESAS60HHaRqDCB7V5XxZa33NbA
         SRKTKlIWZ2gR1oDWHoa5UMeoh+34a+qT9GptdQKPnXe14G+Tnji1sVZ1sK0ZmUmhfE84
         eC2WxkceMa2S5T03eHu5koakthDpRiFFnxEBp+1xYaCRb/1GWlcw4JtFdgaZ7YxdqIeL
         YvbG2E9VzPIkD8C4sF2hG5FubWY24kk073LJWqTv8IYYvB93UYEILPt0P8IZihuV2bgf
         6J7A==
X-Forwarded-Encrypted: i=1; AJvYcCXltoud3+WqFBEM8T3JCW4iKnTdMxXjhwAGpJeiD9X60R7iNxRSXH0AnGYj8jT9tV1y9E9J/n4arq4MPQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyBLl0kB3b+QzvHAPCFtrDQ0nthurwgFUd7LsGjP6ovAAzL629J
	OHJiQzI9WFQR2rLKsvrCYgOULWaju99Utpbq1PhhIyt9gc5GZbv1rCHKJBE/aLH+KByIyDt6ENL
	JHmR2aR78tuglk4eqzH4dxnP8ala6R8M=
X-Gm-Gg: ATEYQzwRc8FSZRRP3zQSj4kdSu+hg1PQACPG3IpgJFtErwKsdxGO7/4ppZPzgcBrdxM
	BPBsgJNQvIhHo0PthXhp430oWaIYRNtPbsNMogzp8ZAsswoddZSXGyxQTW4iaoqB7SvBXWCQ7G2
	rnAErBGrdsNJhPZBmz9OT7y8+mRKpTlDD2g7Hx9lrU+XZvMfc/W0tQF6B4nYdDZX1N2bR6WUGrE
	oaywgyuB3vZCls6o62DEfdpKOBxxGyyc7sSYqyGDHPXPFYV+OhpBfz0Qjz1xkFXdSR5GeSxm5Sq
	RlmIjq4=
X-Received: by 2002:a17:907:cb1e:b0:b9b:1f3f:dd80 with SMTP id
 a640c23a62f3a-b9b50312610mr680480766b.1.1774962259673; Tue, 31 Mar 2026
 06:04:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260329203249.563434-1-julianbraha@gmail.com>
In-Reply-To: <20260329203249.563434-1-julianbraha@gmail.com>
From: Jesse T <mr.bossman075@gmail.com>
Date: Tue, 31 Mar 2026 09:03:42 -0400
X-Gm-Features: AQROBzDBuMjX5kNXwiuBU-eUGbvIngufrlEpri2R3IjCABLf6WLJus2y94Gwy_8
Message-ID: <CAJFTR8QwfJ2aGnqeVou1y=UZsvXr=4TPFUO_bxgwi82nw7nVrg@mail.gmail.com>
Subject: Re: [PATCH] riscv: dead code cleanup in kconfig for RISCV_PROBE_VECTOR_UNALIGNED_ACCESS
To: Julian Braha <julianbraha@gmail.com>
Cc: charlie@rivosinc.com, palmer@rivosinc.com, alexghiti@rivosinc.com, 
	pjw@kernel.org, aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_060422_492893_CFFE0D80 
X-CRM114-Status: GOOD (  17.61  )
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

T24gU3VuLCBNYXIgMjksIDIwMjYgYXQgNDozMuKAr1BNIEp1bGlhbiBCcmFoYSA8anVsaWFuYnJh
aGFAZ21haWwuY29tPiB3cm90ZToKPgo+IFRoZSBzYW1lIEtjb25maWcgc3RhdGVtZW50ICdkZXBl
bmRzIG9uIFJJU0NWX0lTQV9WJyBhcHBlYXJzIHR3aWNlIGZvcgo+IFJJU0NWX1BST0JFX1ZFQ1RP
Ul9VTkFMSUdORURfQUNDRVNTLiBUaGUgZmlyc3QgaW5zdGFuY2UgaXMgaW4gaXRzIGNob2ljZQo+
IG1lbnUsICJWZWN0b3IgdW5hbGlnbmVkIEFjY2Vzc2VzIFN1cHBvcnQiLCBtYWtpbmcgdGhlIHNl
Y29uZCBpbnN0YW5jZSBpbgo+IGl0cyBzcGVjaWZpYyBLY29uZmlnIGRlZmluaXRpb24gZGVhZCBj
b2RlLiBJIHByb3Bvc2UgcmVtb3ZpbmcgdGhpcyBzZWNvbmQKPiBpbnN0YW5jZS4KPgo+IFRoaXMg
ZGVhZCBjb2RlIHdhcyBmb3VuZCBieSBrY29uZmlybSwgYSBzdGF0aWMgYW5hbHlzaXMgdG9vbCBm
b3IgS2NvbmZpZy4KPgo+IFNpZ25lZC1vZmYtYnk6IEp1bGlhbiBCcmFoYSA8anVsaWFuYnJhaGFA
Z21haWwuY29tPgpSZXZpZXdlZC1ieTogSmVzc2UgVGF1YmUgPG1yLmJvc3NtYW4wNzVAZ21haWwu
Y29tPgoKVGhhbmtzLApKZXNzZSBUYXViZQoKPiAtLS0KPiAgYXJjaC9yaXNjdi9LY29uZmlnIHwg
MSAtCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9LY29uZmlnIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4gaW5kZXggNjFhOWQ4ZDNlYTY0
Li4zNWEyOTI2NDk0ZTEgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9LY29uZmlnCj4gKysrIGIv
YXJjaC9yaXNjdi9LY29uZmlnCj4gQEAgLTEwMDQsNyArMTAwNCw2IEBAIGNob2ljZQo+ICBjb25m
aWcgUklTQ1ZfUFJPQkVfVkVDVE9SX1VOQUxJR05FRF9BQ0NFU1MKPiAgICAgICAgIGJvb2wgIlBy
b2JlIHNwZWVkIG9mIHZlY3RvciB1bmFsaWduZWQgYWNjZXNzZXMiCj4gICAgICAgICBzZWxlY3Qg
UklTQ1ZfVkVDVE9SX01JU0FMSUdORUQKPiAtICAgICAgIGRlcGVuZHMgb24gUklTQ1ZfSVNBX1YK
PiAgICAgICAgIGhlbHAKPiAgICAgICAgICAgRHVyaW5nIGJvb3QsIHRoZSBrZXJuZWwgd2lsbCBy
dW4gYSBzZXJpZXMgb2YgdGVzdHMgdG8gZGV0ZXJtaW5lIHRoZQo+ICAgICAgICAgICBzcGVlZCBv
ZiB2ZWN0b3IgdW5hbGlnbmVkIGFjY2Vzc2VzIGlmIHRoZXkgYXJlIHN1cHBvcnRlZC4gVGhpcyBw
cm9iaW5nCj4gLS0KPiAyLjUxLjIKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
