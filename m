Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C89606A319
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Oct 2026 06:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GAarPjUP;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=XYj1CN5K
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8xfggB09+53MHzgyLVP9ffX/+sLovqKBWwVNHzk9Oe8=; b=GAarPjUP+GUaRr
	uizfvCN6G8vCLNQKP4yR9+LTznwVN+fNEMLPM/5wi0kXaVcoIEfxQjKnecNkD4ctfh43/tX0cSxbV
	r6FZerjL+JpwFKhjmP/zKKbJpim27w893tPgwCWYYBak1jNYPXg/mlZi+8nCo+JTvqi7VK0SpodJW
	E4P6wrnwL4ZS7eUkHdZxnZPp9r7Mr8jBR9GWEWXqyTzydmMudrJKM+ENTr9JYmimD7bJjEoyd+fhp
	Co0Z6o4vzBOz5jysHoAx31+L8yqNSKy6vFJer6QtcHDacC2rf/Nm8ZU7524pfRd44pbA+QWmM1oeH
	tM3vsdPkhlouHmkBI1MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJmHJ-0000000DSvB-1aed;
	Thu, 22 Oct 2026 06:27:53 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJmHH-0000000DSu1-06SA
	for linux-riscv@lists.infradead.org;
	Thu, 22 Oct 2026 06:27:52 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-3a772ec8389so11598061fa.3
        for <linux-riscv@lists.infradead.org>; Wed, 21 Oct 2026 23:27:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792650468; cv=none;
        d=google.com; s=arc-20260327;
        b=U1A/sQ3K50ze8wM9QbU/2ZtC4mfS94zksIWHEWq0obsSaS7GHwHIcXuprbqcXzZ1de
         EQ8BEdgPNXT9N6HjLcHYvYCAT3NilouwmgbeEw069zATO0QQKZ+DqwZbstX9WDsulodG
         WheKstpAbg9NjW4GeGi1x4x0AvugVKX+6MAqmKDkX6ybCmEkvDeQTpvL8KsFGd8uNae1
         gJaAnnaZ/c/ctaqn29uia2Gw+KjF3rKD5ByIg2gIGIId3Pyty+SaW5LLQmtHQs4VJ/iv
         +mcpZaIgYejAHzIubqKyC4GkRqJQ7taKwVwac6wR/tZOPwGuyoR93zSKpAGA8oSF45sR
         w2Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c8KWIoZNW6/QAD3FZ28O4CFbS3YPAHolywa/ZQAktrE=;
        fh=VtUL/sSS/HZNRR+2XXionTlxx/Od10aeiOjl+Qc4q0Y=;
        b=OB1i0oAennAKUTlbMgiowDVlbZqoBu45HluMqpTlcW6pqb2HN7fOq1Kfk9BE5gtBqf
         QDC1BK9z8nZdSl4syagcJEZAWxid+Jlgw3febh34UAODQOuy24btkHUfDPB6idEMEV2e
         mHacBw5SLZ1+x9/CYLOLaXwbQ28PgC7PmRJuU1Ft9TSXurtrfKaXRH5Y0PbnH2OwtTmU
         AvqsKHXwGKOqlG5fsDmXLk971anYZ8le/agAKHzGGN1g1j7He78nWUkKY5K84yNlBQg2
         kR3iD2LbrvI79heJJL7G4EUfmpYUR1yjytg4WkNk+fKvZZkAislL6Pd8HMMLuErrVRnq
         eVuw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1792650468; x=1793255268; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c8KWIoZNW6/QAD3FZ28O4CFbS3YPAHolywa/ZQAktrE=;
        b=XYj1CN5KXzj8KniwrQniokByk/OCVNkIWwhXHk/EpAcSu+prGerW5mK2aDXMtvMPst
         SCKP4DVWDpi4q06K3Z5vgPRZ/rcxrI1kxQDSMkmXjlbWCpk+7p+XUJoxB8FC8J261nHW
         x70i9IHJTVtAby0B37yMlA1M6AofPUPYgGc92Lsx5IGwmfrjExzmAeYydB22OejMmRLt
         ndU/SAQVddXmXT9j7S+PSH/D9JIIj4IPFnN3MQdfcFsArgZuOOqphr2LnWRE4s74WkXC
         DL00pEatmKuUR79IZ3VtZ5VHVYjI5iLchzUSxpD2t8mtRqjRh5uWwMjnlERWR1Of7tUs
         83TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792650468; x=1793255268;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c8KWIoZNW6/QAD3FZ28O4CFbS3YPAHolywa/ZQAktrE=;
        b=UINb6v2AvR+i1I7YehF78CKKLivM1Fm4t8mFNktfpfjsFDZ3dEJmf7bhE2jTgMLlXe
         AlaeHlBhPYG+QvWI4FRaSMBclUKlSanBGHE1jHnOj7E1SaiBaBJ5gIIrzbEOOiXxDYP9
         BhamZOKQswM6HqgLpzkGx09rpCl3sZxPao3Xuu3kikj3g5P+bbbQICx6b+l5Ky2AcrQJ
         nIAcKnDDeumxX40OnReW4rK21iRCINen0ExTKnkcVkVUaWYaS958fY5iIRMVA3ftyi81
         d5OQuDEIKJmumo8CK01nX5U8MHGK67LbjbYIEbg8UDUJ5cPi4dJ1h9ge/BlUbVUp9YIt
         8xGw==
X-Forwarded-Encrypted: i=1; AKwUvBwAYRcb+XU+4rzQm4aSvFnZ3D6nogtKrhpJH8KDdRHQsVnKOcFyLSbfOTO+/80uc5Brwx1CHfibpUE6uA==@lists.infradead.org
X-Gm-Message-State: AFq9FYKMjxutfUSMd8LQhPJ3HLwUHHhxF3DqrEqh+uOQu0pE75j+Df0s
	XHgVRtn23LSFZT3fyZsZ5Wsj97bb3PApSsV/rQMvglz41BdVk9xY2azsVKOPicb49qmv1NMMV9y
	fQT2kwQZ2OG5eyA8Owt+SvLkhDUpD0/kNeTkxOVPAlA==
X-Gm-Gg: AYBFou38wX/5RAgoOMSaX3+U7LsEkFXOOY6OrYnUK/V5SbUr+ySi74JfOqMYqqWxZHI
	MtDZJeVNdhG1XgrGf+8p90olWNSNNzZ2VH5o5smKT6ayK9/xanRkHnwVb0Myzff5YSXgLAvEJmX
	kXigBjUrkurBgHnqIZydOKDn5a26gWy9PN9W8C5ZpdgUk5JQzD+f7VLtX5eYbIR9w7aVfodth2X
	BRJSr/WCidN9xKPJtsx6Dw+r64Y/GRNqyYEvZanLVSTd14sc/R9NHGEvdG/ytS8xlBBhtACz0PO
	n5XqOoHNf+SbAKkMt0lKaiDHwMQefIPis0NsOSgC/QRKkaMwc7IIZuMiKaKrnQnCEgFJOpVMwvo
	NeiRdIPM6LYheNPMNfBGLU6sWSx+1Kz9RtvfnMxJ7oc4+JYzPB4a86Ddjp739Ow1qlgADjmh60a
	sDtZSCcCOLb2q7Hl1nXx5kTuZReLEAukmfdV1G7Z9hwfCbFoZAmgaQHddEVQ3QSuWoNBsoZhNWe
	WjbWA==
X-Received: by 2002:a05:651c:3134:b0:3a9:9a3b:6036 with SMTP id
 38308e7fff4ca-3ac440b53c8mr12628651fa.2.1792650468375; Wed, 21 Oct 2026
 23:27:48 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261014224239.963635-1-heinrich.schuchardt@canonical.com>
In-Reply-To: <20261014224239.963635-1-heinrich.schuchardt@canonical.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 22 Oct 2026 11:57:36 +0530
X-Gm-Features: AclHuK-9TFsRegjYZcIPEHWDYDOWlB5NKzsnn-yH7Qq40hb2qm3j1NzJo9FfRwI
Message-ID: <CAAhSdy39UtV0sUqL0=FX+HWa7oAH0fkei1cFKiF6OBSSFT=gdQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] RISC-V: KVM: Allow Zicclsm, Ziccamoa, Ziccif, Za64rs
 in guest
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, 
	Sarah Emery <sarah.emery@canonical.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_232751_085996_50A9D553 
X-CRM114-Status: GOOD (  11.84  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVGh1LCBPY3QgMTUsIDIwMjYgYXQgNDoxMuKAr0FNIEhlaW5yaWNoIFNjaHVjaGFyZHQKPGhl
aW5yaWNoLnNjaHVjaGFyZHRAY2Fub25pY2FsLmNvbT4gd3JvdGU6Cj4KPiBFeHRlbmQgdGhlIEtW
TSBJU0EgZXh0ZW5zaW9uIGFycmF5IHRvIGFsbG93IEtWTSB1c2Vyc3BhY2UgdG8KPiBkZXRlY3Qg
WmljY2xzbSwgWmljY2Ftb2EsIFppY2NpZiwgWmE2NHJzLgo+Cj4gVGhpcyBpcyBqdXN0IG5vdGlm
eWluZyBvZiBoYXJkd2FyZSBwcm92aWRlZCBjYXBhYmlsaXRpZXMuCj4gTm8gS1ZNIHNwZWNpZmlj
IHN1cHBvcnQgaXMgbmVlZGVkLgo+Cj4gQWRkIHRoZSBleHRlbnNpb25zIHRvIHRoZSBnZXQtcmVn
LWxpc3QgdGVzdC4KPgo+IEhlaW5yaWNoIFNjaHVjaGFyZHQgKDIpOgo+ICAgUklTQy1WOiBLVk06
IEFsbG93IFppY2Nsc20sIFppY2NhbW9hLCBaaWNjaWYsIFphNjRycyBpbiBndWVzdAo+ICAgS1ZN
OiByaXNjdjogc2VsZnRlc3Q6IGFkZCBaaWNjbHNtLCBaaWNjYW1vYSwgWmljY2lmLCBaYTY0cnMK
CkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClF1
ZXVlZCB0aGlzIHNlcmllcyBmb3IgTGludXgtNy40CgpUaGFua3MsCkFudXAKCj4KPiAgYXJjaC9y
aXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oICAgICAgICAgICAgICAgIHwgIDQgKysrKwo+ICBh
cmNoL3Jpc2N2L2t2bS9pc2EuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgOCArKysr
KysrKwo+ICB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vcmlzY3YvZ2V0LXJlZy1saXN0LmMg
fCAxNiArKysrKysrKysrKysrKysrCj4gIDMgZmlsZXMgY2hhbmdlZCwgMjggaW5zZXJ0aW9ucygr
KQo+Cj4gLS0KPiAyLjU1LjAKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
