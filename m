Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F99606A31A
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Oct 2026 03:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dYKqZp05;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=EPHNdmTF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HmmUR5GACnDcuvK982ASj4V8tKfmtUHr5Gl17yLHV1Y=; b=dYKqZp05cvECs+naFSw1JwzotW
	Jr1eUrjgY4ze4kIfgGVwOng4Vwj6ErwhALdhnXOQo/ohhVqJfbbjfqE30tHq4bdXYw/Nt3ZgG1/Lr
	1psz5KjiNvlR24veGkP0jnFyygJW2qhrChLC1SYH8swFCXZ00RtPnfj+vfu2gIKNvxPf9yE7lFWzY
	lipTOw8aA2JIIwvM7WIiO487+H2oFzEdltINcfM2akBr3zBG6l6stJuoSRWVI97mAXR52Owg/xltG
	mO+4Q7RoAAhIYu3MIJNj10mQ0B26KS5R963VdTtL6rhfBluswAl4sBardBcgil71DaaxFzSeHh2ZU
	aocGHYag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK6I5-0000000FSPJ-1rXT;
	Fri, 23 Oct 2026 03:50:01 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK6I2-0000000FSNl-0eR0
	for linux-riscv@lists.infradead.org;
	Fri, 23 Oct 2026 03:49:59 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4a20b122af8so3185205e9.0
        for <linux-riscv@lists.infradead.org>; Thu, 22 Oct 2026 20:49:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792727396; cv=none;
        d=google.com; s=arc-20260327;
        b=BAyC20QSO3lJQAAMH9wIe/xzXR/OBGEQK0+5fy0/1XUjY48AYR+9FrZWWpdBoHVZ5c
         u2XWJcK+32kWoPn/ByyIZ9ALuPLAxfMot9ENQOCl/+779bBvs8m12IkycJVDHXFkHV5A
         IcBPLfVTFImAmyVeBEn69C1HzGo1M4poOK9QNwcYEMWxisfXRe3HjmvToWu3Q51bXm7x
         5rJy0GAfRbbSgy3iWX5rkh07wPb0BH/jtTjlo0sYTJcwNf+ogbw5+cnQYyEbMKXnHqto
         fluJ7HvU0pqXpum3DfvJQqUmFE1PRGYb8A+xcs4FbyNHNwzWa8fU3Dbrusw0nOLmIzyh
         G+fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e8SruC8g2rwvdIhh7oEO3GCo3RXeoIg5jF9AOnzr/wQ=;
        fh=21Cctb+t5bfnKZ/o3bcXgzQTvNz8PCIVc+utPFiBs6I=;
        b=eHAzE6rSBSZ7oHCM0VZKm2j1RhsLvGRXc/9/wrLmcWjaMkgC8CxiXilbVP8X3QB8Hq
         SZwOoSqTVdxyHt1g9rLzGcrGx1hqTMT+vbFc2n7IvH3HFSpniedXOzwW5BLkR4oWYiLw
         lV4jBkHmpLIpsq3cDuQ5pL31BXeDw3d1UHQX+u5e/IXnUK/f22gvuUtF0RDN2CbNMwL4
         guEqZZLj9OoYUoA63O4Bbp822YQ1vP9aInDGao1SYcXkwj7VGTSO3rqekZ7AysG/j6ac
         fboVU9TQrQCS2f1s8FO7WtJb7gtS/SArh1kO0lR96GwG+rIELk9kc2IAM+X5YiRUge2R
         SJeQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1792727396; x=1793332196; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e8SruC8g2rwvdIhh7oEO3GCo3RXeoIg5jF9AOnzr/wQ=;
        b=EPHNdmTFHWaE/OypCx1vXsosPRmYYfUEi1rRYdI/e/MlhI5aP6QrpT+1vLnF+x4h2p
         mw4YlG65f6pXmz4q7ylR+yGPu6nMxHAzbLmXAe8rWoO/PQUS90s4CpyPpOXq22x/psnE
         iJNRj6QeY7Wo17IYDBDzaC6D//tYZcjqy6BUZcYoodHimEFkI6b9Y43ABY4hB6lWOsXD
         pVmt00IkGoSmBTM7erKGN5haraEMk6ByLXc+Uqlo42MNPvH3gjw4Gtj34jm/0KVtgm80
         QO3utz95XG46I5jB9EiwV3It3ns2gOLSFldZXetrZacAJPFZ2fWmsqYqRg0ISIR2Ca/Q
         T8VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792727396; x=1793332196;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e8SruC8g2rwvdIhh7oEO3GCo3RXeoIg5jF9AOnzr/wQ=;
        b=iv6MJPIHhS2uybBTqDp3SVOHbfjcfy5UtNz67bbHroTyGrxTj0Ev5iJNtCi4Bkqv31
         1vEvO52zHxuasqyVRKcmy8xPP0iIFUAaOx+UYQ3+zZXp0avg3R5b+IeUe7ctjOLbMKEK
         2NPmpRUIhybN7EaD3S7+SVhKLUPYEbiV0Kj/vo/46ND/eUyoJ8sGsaUcq48gJnFFk0jn
         ejWpMhVcUzy3+HtblK3r5JhfVqV/OYGlRgQmrcJI9kRO+YhXWiAgY5ioylRhnC9CNXzX
         /WLOF5qI/ARiJ9nkyO/1gEI+DZJ2d1h1JEgoUeNIFZcfWRk2Q6ddStty7VShXMYe0XaO
         aRMg==
X-Forwarded-Encrypted: i=1; AKwUvByo4BdzoaN1QUJGGzCV9cOfJa9UgMNNbtgLTd6ElWypHlfjSyJbdr6lVlX9am/qtrtbnkjHNAdG4gLGfA==@lists.infradead.org
X-Gm-Message-State: AFq9FYKTdlVLG1GekWFvfOJQ4x0w1Q2QO7bBoLYDTs/6hOPWzE61lF/d
	cJoinBisopsAduMMtsZzSKMZFCU2Epy5mgRWDd/lKfpCV0Hmv6Kmjb8Q2qdXsLlXtd7AGp+BnV5
	qprkf+I/a4pD4qzpwfbDg3I+fZJwo/TSb3OcOkJQCOQ==
X-Gm-Gg: AYBFou2jXP/hRCw88J/HskNRKlU2o5UbvW45Gt+oibaESUkotIdvlohWNIG/ikfi64H
	I+63JOQcinYcTj7Yc6LiKtQwu7pBqrrPjZzmwBi+FZIulaSuqy3qfwzdTPVlJrY39JSX4OA9P9U
	Tm7edsXLosbL3PbViEZu3CQbgGBkSQ2UDWb6iCZpU/UjKU8lBnjjJMulC2ApY1CRnk7WkcQHbp2
	vhqOiNUd9qsY+GV1GGV0tKp8620o+KTEslSuBV0m5OJ6XmXRBimYrwdeKssRbf7lhqH5mPHScKj
	jie+jJHUZif3GckXPuPyEDt9pElBbKbOQwuiJ4v6PpArQRudiGfTxjFeC1CDftHqLNtuh+zTNHI
	K/Ujgx0Ll15RfnhTlE6KHkBvjpPaB3viusaweeO+zW6IUP9djevxAwferXCPNboUhG7duCsqv1p
	AJcqst6G5guZ3KeM7TpKAc79eHR/2zukbV/m2AqTDk10q5sWa5qA+LpgE=
X-Received: by 2002:a05:600c:a45:b0:4a1:fae2:a8ab with SMTP id
 5b1f17b1804b1-4a211c78b0fmr14407705e9.3.1792727395607; Thu, 22 Oct 2026
 20:49:55 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <CAAhSdy1zNA7Xn9Uv1fFTRJMuCP0Pd2xLQazzm2FedTo_DZwMCA@mail.gmail.com>
 <CABgObfaH4-Ud4VR=GC8giDmWGJWS-tvYSmPOs4TtWg2hm4ocqw@mail.gmail.com>
In-Reply-To: <CABgObfaH4-Ud4VR=GC8giDmWGJWS-tvYSmPOs4TtWg2hm4ocqw@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 23 Oct 2026 09:19:44 +0530
X-Gm-Features: AclHuK-CvaYfVDOqEfQN7aLUZ5bdjR2uJDsmHLdPAvhCz9ZB6h-rXHKmpRHIUtw
Message-ID: <CAAhSdy15rF2Hj8Zph7n61tfW79iSPe8mvLpy+eQRcyvAC0TZCA@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/riscv changes for 7.4
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	Atish Patra <atish.patra@linux.dev>, 
	"KVM RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, KVM General <kvm@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_204958_213389_60EB0539 
X-CRM114-Status: GOOD (  17.25  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVGh1LCBPY3QgMjIsIDIwMjYgYXQgNjozNuKAr1BNIFBhb2xvIEJvbnppbmkgPHBib256aW5p
QHJlZGhhdC5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCBPY3QgMjIsIDIwMjYgYXQgMjo1MeKAr1BN
IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+IHdyb3RlOgo+ID4KPiA+IEhpIFBhb2xv
LAo+ID4KPiA+IEkgd2FzIG9uIHZhY2F0aW9uIGxhc3Qgd2VlazsgaGVuY2UsIEkgYW0gc2VuZGlu
Zwo+ID4gdGhlIEtWTSBSSVNDLVYgNy40IFBSIGEgYml0IGxhdGUuIEFwb2xvZ2llcyBmb3IKPiA+
IHRoZSBpbmNvbnZlbmllbmNlLgo+Cj4gVGhlIHByb2JsZW0gaXMgbm90IHRoZSBQUiwgaXQncyB0
aGF0ICpub25lKiBvZiB0aGVzZSBjaGFuZ2VzIHdlcmUgaW4KPiBsaW51eC1uZXh0IHVudGlsIHll
c3RlcmRheS4gIFRoaXMgaXMgbm90IHRoZSBmaXJzdCB0aW1lIHRoYXQgSSBub3RpY2UKPiB0aGlz
IGFuZCByZW1pbmQgeW91IG9mIGl0Li4uCj4KPiBUaGVzZSBhcmUgODAlIGJ1Z2ZpeGVzIG9yIG90
aGVyd2lzZSBub3QgbmV3IGZlYXR1cmVzIChlLmcuIDMvNC81LzYgaW4KPiB0aGUgbGlzdCBiZWxv
dyB3b3VsZCBiZSBmaW5lIGV2ZW4gZm9yIC1yY04pLCBzbyBJJ2xsIHB1bGwKPiBuZXZlcnRoZWxl
c3MuIEJ1dCAqcGxlYXNlKiB0cnkgdG8gY29tbWl0IHN0dWZmIGFzIHNvb24gYXMgaXQncyByZWFk
eSEKCkkgZ2VuZXJhbGx5IHVwZGF0ZSByaXNjdl9rdm1fbmV4dCBicmFuY2ggbXVjaCBlYXJsaWVy
IGJlZm9yZQptZXJnZSB3aW5kb3cgYnV0IHRoaXMgdGltZSBJIG1pc3NlZC4gR29pbmcgZm9yd2Fy
ZCwgSSB3aWxsIGVuc3VyZQpyaXNjdl9rdm1fbmV4dCBicmFuY2ggaXMgdXBkYXRlZCBzb29uZXIu
CgpUaGFua3MsCkFudXAKCgo+Cj4gUGFvbG8KPgo+ID4KPiA+IFdlIGhhdmUgdGhlIGZvbGxvd2lu
ZyBLVk0gUklTQy1WIGNoYW5nZXMgZm9yIDcuNDoKPiA+IDEpIExhenkgVi1leHRlbnNpb24gZW5h
YmxlbWVudCBmb3IgS1ZNIHNlbGZ0ZXN0cwo+ID4gMikgSW1wbGVtZW50IEtWTV9QUkVfRkFVTFRf
TUVNT1JZIGlvY3RsKCkgYW5kIGVuYWJsZSBjb3JyZXNwb25kaW5nIEtWTSBzZWxmdGVzdHMKPiA+
IDMpIFNob3cgc2VwYy9zY2F1c2Uvc3R2YWwgQ1NScyBpbiBLVk0gc2VsZnRlc3RzIHZjcHUgZHVt
cAo+ID4gNCkgVXNlIGEgcmF3IGxvY2sgZm9yIElNU0lDIHdha2V1cCBzdGF0ZQo+ID4gNSkgUmVq
ZWN0IHZDUFUgY3JlYXRpb24gYWZ0ZXIgQUlBIGluaXRpYWxpemF0aW9uCj4gPiA2KSBVcGRhdGVk
IG5leHQgYnJhbmNoIG5hbWUgaW4gS1ZNL3Jpc2N2IE1BSU5UQUlORVJTIGVudHJ5Cj4gPiA3KSBB
bGxvdyBaaWNjbHNtLCBaaWNjYW1vYSwgWmljY2lmLCBaYTY0cnMgZm9yIEtWTSBndWVzdAo+ID4K
PiA+IEluIGFkZGl0aW9uIHRvIHRoZSBhYm92ZSwgd2UgYWxzbyBoYXZlIHRoZSBmb2xsb3dpbmcg
Zml4ZXMKPiA+IGFuZCBtaW5vciBpbXByb3ZlbWVudHM6Cj4gPiAxKSBBdm9pZCByZWR1bmRhbnQg
aW50ZXJydXB0IGNoZWNrIGZvciBwZW5kaW5nIHRpbWVycwo+ID4gMikgRml4IGJ1aWxkIHdpdGgg
dmVjdG9yIHN1cHBvcnQgZGlzYWJsZWQKPiA+IDMpIEZpeCBJUEkgZGVsaXZlcnkgZm9yIG91dC1v
Zi1vcmRlciB2Y3B1X2lkCj4gPiA0KSBSZXBsYWNlIGltc2ljIHN3aXRjaC1jYXNlIG1hY3JvcyB3
aXRoIHJhbmdlIGNoZWNrcwo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
