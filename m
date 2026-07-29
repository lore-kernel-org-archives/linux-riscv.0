Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE988C53219
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 08:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4kAm6XGOyFGIHnA4vZGJJA6RYmMiy/03lEENR0wKXjA=; b=Ayg6+2238HwNXo
	b5nIK+d+t/jdfa7IeU8DTM4wsk/Z36ozp/Uvk01D9w/v9Gm0LHmctEriUNXeIqnpI95hvwlrJPosT
	VaNFBgpM1j2PpYrDOK0LXNQZOfRR1GINunAu4kp/rFJmIKQiDLkPAAkFILWdVvZGrqa9hMGnf/u65
	lrwiJYeCgcj5NzEdIMMEe19HZo7EtHd35BuJKFxyKc9yZfG9CupusrVJDJ9FhCYW/uYFYK8DZcPpB
	DkSVcjHK9tAM8aIgaEskNDem7gPhjJjUl2UH+IigTZO6m/aIm4Iu5JLLU51YCvtvlBnMtZ4rQ0alR
	skYSkPtvYwbKZIXpbTfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wozCk-00000007BEO-2vmF;
	Wed, 29 Jul 2026 07:59:54 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wozCf-00000007BDO-43e3
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 07:59:52 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4956869750eso4429345e9.2
        for <linux-riscv@lists.infradead.org>; Wed, 29 Jul 2026 00:59:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785311988; cv=none;
        d=google.com; s=arc-20260327;
        b=KPEL+IJgeg2dmkaC7JtvHZY/H7xAVaBFsyOPiwI3gFn/X2cI0syPU/0ZtAJChIiHcD
         zT6DugDt5aQQNMlJ1jPwtbyuZsvGgMcoX4N471NrPn8C+V46O8lrpYxDwRusONJiyv1b
         Gw8rQorO2pYrf0OaQM2yndd+Bb9/WIy7NeBTiE2eH8tcB7AuRPq+cBO+fzsN94OzZe74
         Rb6RfvVVRqNHAu0Fhq817dttC9oIKdlJ+JTZKH3g3x5JmycP5cg3FtvXW2wUY3FAFi1h
         s7aMdSwsK3gICXM0QcQTIQHJ1dIpqROcJ3/KYY9gV7ibSkpzL+yCb+6gGtuQ0GiUlZTX
         M2RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QVvOzRbPCBlb9W0NH5g6QA4DgSsn5yXPXhOYOe+ERRA=;
        fh=wFYeDxzL8oYj14zeFf/0uAuXvWZHvJIDrzM5gO5iXyw=;
        b=NfFl3xam/Fd8ti9l0rpJHLis1pDkqIR/WaCAVhPdlRAqElFnVSlCukc6qWrl8MhIl0
         5YqcnscH+hE0Hu2WBBbW10gsRKaLo1R/knzLH010brTT+B9nivYJlgxubYbioVwW2ZhP
         gegN5c70YC5y6ZC1GcXI3WjRmWYT7a8iSknQRsLOLbClHxE/69kqcBBxMWhkVoFVHYV3
         mAaPQMe+sS0q5NioeuxVKlrrE7QIfCnB6Z+9kfyJYoc4dhmPAoXbvA7CtH2VOxh1frA4
         eNYLf12aDJ3QdLFixVBePMXgcIhneTFG1wqkke8yS4YPgUqk0uAB6x0waYqr92pbRJsu
         YaSg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1785311988; x=1785916788; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QVvOzRbPCBlb9W0NH5g6QA4DgSsn5yXPXhOYOe+ERRA=;
        b=qrt3oV4Z68jT97OuYdu6zHpNiE15jWTmKseupl9j0oTP1uSGUKwPyNZHbtf8lvqAxe
         BlreuZ0c9OG+Ds2Z4OLvJBPnskSIzvQq0mH5Jqs0ENIHltj1Q8/qgorxlqHtUKjxjGZq
         eZKgdckBR9Jb4lH4NMiFKJ5jp8AMRZodoHW7+Ao7liPZE/Ri0rNA2SdNzuMv9C7XhQHO
         5ChSLfJycOSWJWlhipEKVasX+2qoBjgeTdTsKumirLHJ44CfCCx6xkzV/Nv5J4sS7ONA
         LtS8mfplAQ0ldZntUATy0yetn+xdXKeJwDAqD72P1wNKF6ksL/zEc+qJK4S0wddxsdpT
         6AZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785311988; x=1785916788;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QVvOzRbPCBlb9W0NH5g6QA4DgSsn5yXPXhOYOe+ERRA=;
        b=OPGfLFPkhd8yxQSCXMInXCVgKolo4Ysl4mlyCeYnRle9MieKnedX/3prBeRDXjeVXY
         BSCETIOZ9l1FzAB7Qzgb+9QTiHg2ptYOjS4eo08ukqG1JMfIUNpuo97ZDQftva3F/wcm
         k8eo670ufpnlSbqVqB+j6OEok8O67N+PaZWYtAtl1rHvrzNqMI67phuRfabCheUm4AoX
         QxZsdHVyv/LKrhLBNfDMj79SLQxPWUEmj/UjAoNHRfy2cUXOzo3TvmiWQXaOnTS/m+Ca
         +5POlw52SjL6jwDzn3sF7+pk6NdIO5TJgWSEYpr5kyoFJWQQDoC0tdL7L/6dDsD4knio
         rxKg==
X-Forwarded-Encrypted: i=1; AHgh+RqkGG48iVWK572QljuapN14+e02EiBmSppr9sxf2mUQ+ZIuJs4iVlxweRlZp2D2erfQok9eWTW8nGy1GA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzwET7un2XCXCHLwpkTRrmPD6eLMkfDJtYq0MoiBLCTAzGRL17s
	o5e7jrbiLzKkdgjaKq0iTknZnAKoTKhPTkIXivpcjE0Qswd9+wM77Jl9sKewJ24eu7R3zB77pt7
	QJmCk72c3851U5YIdZj7CHZ6x+HNTFQXq9EWwmChbZA==
X-Gm-Gg: AR+sD13zIVUQKi677UIqSTkL5cU1EARq919Yw0Tewa5uMngqnFNuVPf6WLv4ZZUdeAh
	q++NIWfkM26KuvmFlVpPby10z9dLMGkRBd4XuWfwku/dwREFhWRtZtXR/nDYjJg5gpZ5fGKUhZe
	HuDOtP1nbcPQTtywfgd5hKfuCrwVpXiwL0Txn6tbrdOWTXutTCM4LvlXXK3C1WOKfmnC+za5F9R
	BhravE4aBWLbgOk06U1TW85W7yKGxGIa2WkwlJjB1iIudlw5o4XErTnT/nLC3ffAZqEfZDD8R9Q
	2d93hfMwYHhK1ObfjWbJjToYyLuEUPivt3PA0rMHOV49capdzhxwsLBzTojZ2WkexXJsjAAGnt/
	cK3wwYKy7aJCNNd8NxlqAjekIXUxrAXccbZhifHYZaGk8qva2N5GOeJ0F1Tr2Lig=
X-Received: by 2002:a05:600c:c8f:b0:496:bbcb:b0bb with SMTP id
 5b1f17b1804b1-496c6568fd1mr61344235e9.18.1785311987732; Wed, 29 Jul 2026
 00:59:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260706021154.210289-1-inochiama@gmail.com> <20260706021154.210289-2-inochiama@gmail.com>
In-Reply-To: <20260706021154.210289-2-inochiama@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 29 Jul 2026 13:29:34 +0530
X-Gm-Features: AUfX_mz4RJR30cfbJm3UUOJRSHu0t8jpNEHG-kXI5W1mmhuMCQSt5po-UTYLcn8
Message-ID: <CAAhSdy0h03mwK7_N1G+o+0y9Gcb-HEUw1-FepLtHO_1NTpjJaQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] RISC-V: KVM: Add SBI extension validate callback
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_005950_676168_664F2734 
X-CRM114-Status: GOOD (  20.33  )
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

T24gTW9uLCBKdWwgNiwgMjAyNiBhdCA3OjQy4oCvQU0gSW5vY2hpIEFtYW90byA8aW5vY2hpYW1h
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBXaGVuIHVzZXIgZGlzYWJsZSBGV0ZUIGV4dGVuc2lvbiBh
ZnRlciBzZXR0aW5nIGFueSB2YWx1ZSBvZiB0aGUKPiBGV0ZUIGZlYXR1cmUsIHRoZSBzdGF0ZSBv
ZiB2Q1BVIHdpbGwgYmUgYnJva2VuIHNpbmNlIHRoZSB2YWx1ZQo+IG9mIGRpc2FibGUgRldGVCBm
ZWF0dXJlIGlzIHN0aWxsIGZ1bmN0aW9uYWwuCj4KPiBBZGQgdGhlIGdlbmVyaWMgU0JJIGV4dGVu
c2lvbiB2YWxpZGF0ZSBjYWxsYmFjayBzbyB0aGUgRldGVAo+IGV4dGVuc2lvbiBjYW4gZml4IGl0
cyBwYXJhbWV0ZXJzIGJlZm9yZSB0aGUgZmlyc3QgcnVuLgo+Cj4gU2lnbmVkLW9mZi1ieTogSW5v
Y2hpIEFtYW90byA8aW5vY2hpYW1hQGdtYWlsLmNvbT4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51
cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClRoYW5rcywKQW51cAoKPiAtLS0KPiAgYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNwdV9zYmkuaCB8ICA0ICsrKysKPiAgYXJjaC9yaXNj
di9rdm0vdmNwdV9jb25maWcuYyAgICAgICAgICB8ICAyICsrCj4gIGFyY2gvcmlzY3Yva3ZtL3Zj
cHVfc2JpLmMgICAgICAgICAgICAgfCAyMyArKysrKysrKysrKysrKysrKysrKysrKwo+ICAzIGZp
bGVzIGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3NiaS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1f
dmNwdV9zYmkuaAo+IGluZGV4IGMxYTdlM2I0MGQ5Yy4uZjAxYTI4NjBjNzUxIDEwMDY0NAo+IC0t
LSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVfc2JpLmgKPiArKysgYi9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3NiaS5oCj4gQEAgLTYwLDYgKzYwLDkgQEAgc3RydWN0
IGt2bV92Y3B1X3NiaV9leHRlbnNpb24gewo+Cj4gICAgICAgICB2b2lkICgqcmVzZXQpKHN0cnVj
dCBrdm1fdmNwdSAqdmNwdSk7Cj4KPiArICAgICAgIC8qIEFsbG93IHRoZSBleHRlbnNpb24gdG8g
Y29ycmVjdCBpdHMgcGFyYW1ldGVycyBiZWZvcmUgdGhlIGZpcnN0IHJ1biAqLwo+ICsgICAgICAg
dm9pZCAoKnZhbGlkYXRlKShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwo+ICsKPiAgICAgICAgIHVu
c2lnbmVkIGxvbmcgc3RhdGVfcmVnX3N1YnR5cGU7Cj4gICAgICAgICB1bnNpZ25lZCBsb25nICgq
Z2V0X3N0YXRlX3JlZ19jb3VudCkoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsKPiAgICAgICAgIGlu
dCAoKmdldF9zdGF0ZV9yZWdfaWQpKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgaW50IGluZGV4LCB1
NjQgKnJlZ19pZCk7Cj4gQEAgLTkzLDYgKzk2LDcgQEAgaW50IGt2bV9yaXNjdl92Y3B1X3NiaV9l
Y2FsbChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBrdm1fcnVuICpydW4pOwo+ICB2b2lk
IGt2bV9yaXNjdl92Y3B1X3NiaV9pbml0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSk7Cj4gIHZvaWQg
a3ZtX3Jpc2N2X3ZjcHVfc2JpX2RlaW5pdChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwo+ICB2b2lk
IGt2bV9yaXNjdl92Y3B1X3NiaV9yZXNldChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwo+ICt2b2lk
IGt2bV9yaXNjdl92Y3B1X3NiaV92YWxpZGF0ZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwo+Cj4g
ICNpZmRlZiBDT05GSUdfUklTQ1ZfU0JJX1YwMQo+ICBleHRlcm4gY29uc3Qgc3RydWN0IGt2bV92
Y3B1X3NiaV9leHRlbnNpb24gdmNwdV9zYmlfZXh0X3YwMTsKPiBkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9rdm0vdmNwdV9jb25maWcuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfY29uZmlnLmMKPiBp
bmRleCAyMzg0MThmZWQyYjkuLmI2OGFhODMwYWFmNSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2
L2t2bS92Y3B1X2NvbmZpZy5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9jb25maWcuYwo+
IEBAIC02OSw2ICs2OSw4IEBAIHZvaWQga3ZtX3Jpc2N2X3ZjcHVfY29uZmlnX3Jhbl9vbmNlKHN0
cnVjdCBrdm1fdmNwdSAqdmNwdSkKPgo+ICAgICAgICAgaWYgKHZjcHUtPmd1ZXN0X2RlYnVnKQo+
ICAgICAgICAgICAgICAgICBjZmctPmhlZGVsZWcgJj0gfkJJVChFWENfQlJFQUtQT0lOVCk7Cj4g
Kwo+ICsgICAgICAga3ZtX3Jpc2N2X3ZjcHVfc2JpX3ZhbGlkYXRlKHZjcHUpOwo+ICB9Cj4KPiAg
dm9pZCBrdm1fcmlzY3ZfdmNwdV9jb25maWdfbG9hZChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4g
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpLmMgYi9hcmNoL3Jpc2N2L2t2bS92
Y3B1X3NiaS5jCj4gaW5kZXggNDZhYjdiOTg5NDMyLi5iNzM3ZTlhN2ExMmEgMTAwNjQ0Cj4gLS0t
IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmkuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVf
c2JpLmMKPiBAQCAtNzIzLDMgKzcyMywyNiBAQCB2b2lkIGt2bV9yaXNjdl92Y3B1X3NiaV9yZXNl
dChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4gICAgICAgICAgICAgICAgIGV4dC0+cmVzZXQodmNw
dSk7Cj4gICAgICAgICB9Cj4gIH0KPiArCj4gK3ZvaWQga3ZtX3Jpc2N2X3ZjcHVfc2JpX3ZhbGlk
YXRlKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKPiArewo+ICsgICAgICAgc3RydWN0IGt2bV92Y3B1
X3NiaV9jb250ZXh0ICpzY29udGV4dCA9ICZ2Y3B1LT5hcmNoLnNiaV9jb250ZXh0Owo+ICsgICAg
ICAgY29uc3Qgc3RydWN0IGt2bV9yaXNjdl9zYmlfZXh0ZW5zaW9uX2VudHJ5ICplbnRyeTsKPiAr
ICAgICAgIGNvbnN0IHN0cnVjdCBrdm1fdmNwdV9zYmlfZXh0ZW5zaW9uICpleHQ7Cj4gKyAgICAg
ICBpbnQgaWR4LCBpOwo+ICsKPiArICAgICAgIGZvciAoaSA9IDA7IGkgPCBBUlJBWV9TSVpFKHNi
aV9leHQpOyBpKyspIHsKPiArICAgICAgICAgICAgICAgZW50cnkgPSAmc2JpX2V4dFtpXTsKPiAr
ICAgICAgICAgICAgICAgZXh0ID0gZW50cnktPmV4dF9wdHI7Cj4gKyAgICAgICAgICAgICAgIGlk
eCA9IGVudHJ5LT5leHRfaWR4Owo+ICsKPiArICAgICAgICAgICAgICAgaWYgKGlkeCA8IDAgfHwg
aWR4ID49IEFSUkFZX1NJWkUoc2NvbnRleHQtPmV4dF9zdGF0dXMpKQo+ICsgICAgICAgICAgICAg
ICAgICAgICAgIGNvbnRpbnVlOwo+ICsKPiArICAgICAgICAgICAgICAgaWYgKHNjb250ZXh0LT5l
eHRfc3RhdHVzW2lkeF0gIT0gS1ZNX1JJU0NWX1NCSV9FWFRfU1RBVFVTX0VOQUJMRUQgfHwKPiAr
ICAgICAgICAgICAgICAgICAgICFleHQtPnZhbGlkYXRlKQo+ICsgICAgICAgICAgICAgICAgICAg
ICAgIGNvbnRpbnVlOwo+ICsKPiArICAgICAgICAgICAgICAgZXh0LT52YWxpZGF0ZSh2Y3B1KTsK
PiArICAgICAgIH0KPiArfQo+IC0tCj4gMi41NS4wCj4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
