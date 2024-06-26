Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 837A6C2BBCA
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jun 2024 01:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DgkXGmUsDn7RdFzyy6bXFK7JTBQy50DJnt1cjMQwaLk=; b=1l0h2P2fkSLf9r
	tFJ9AqCSOZv8AqdtT7dXbChoHq7XEw2vwS9i3VqaeePrLCwOigWGccOotWDS045fieIRBfAw4h899
	KfKids1q1uEdESWmqvEAFI84wboZ37u4IyGoZEXKnGgDhOJYc+zLE0I/IGj10UIqVSfGVVwqIfsit
	fDz/EFm7NEbjOY+v7sdsxEndv4LgyjBOSCJlruDN0eIW8busb4yMjLd6u47q+Xry9qieXLhA2L48N
	MM+uMnbbc1czz24kqc1IXQBg10N83OpZfB1NORYsMzhPSsjYx+epCy+LYIsXh0vwt8TGTdWs+ok3R
	56zpfq3iRXAs7ue7Qzng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMHML-00000004z37-10Ul;
	Wed, 26 Jun 2024 01:22:05 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMHMH-00000004z1F-3qC0
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jun 2024 01:22:03 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-57d16251a07so4129a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 25 Jun 2024 18:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719364917; x=1719969717; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MDXzXy/x3VAMGE4telAkJ0AkS3Dvfn3YkfUIsKfqDwQ=;
        b=PdV/D82SjGAvt/+lxT4pRBlrC4DagFu8qcZU0BAGuKnHivaLQZsTRpWDV2FjQey+Zz
         V++wDohzR91Oz+U8FtVlw4gpG1JyZ6PeYlu+Y8LnuqrQIfivKU/lt4Nbqrwkb4C7R8Ms
         3LWWHrBVp8XDICd6A7Wj8WtlXIUsH0q/iSrMjkRPchilEEbnjA9EqRrOj341saHcebVE
         uoyL7u8pWcM9Gcq9J/fhAOjoHTFC0pEPjee9yiHFgfbIf7+Bopyjscj1Pwg5Oq16gsbv
         gd8XasWIqIvE3ZLmqr3F9chfQUfFcuykKUqMsn2BeOPm+DfKvGa9y8H/g7XGRtwLn7KY
         FQQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719364917; x=1719969717;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MDXzXy/x3VAMGE4telAkJ0AkS3Dvfn3YkfUIsKfqDwQ=;
        b=bDbqCjt7nlvS8DqTXkPNV1lo0CXMWeKFB7BIVjuHVvGsglv03KjPfeF5Y60Of108hH
         PnAEUTFzb8OAKdVa70dUDGRokfjzsj2RvAtoSsi7xBAj9uVi1noDlDuo2PeIEc91Sckf
         LbjfVsu+ET8dBbWLsbtbp2SArqSOthDtXz/7aV4q9ubiXa9bDb2435Vd55BehHICeFYm
         jKYbF2xZQdQzvNuTghvApefETxgWvzjFDbazX2v7NU4OoFThQNO4Xi3YXJAqlZ4MSHUt
         RzORARYFMWDRX/Kf83ug4EMZ6ZLdg5vQGMhiUDpvqAaGcxD56bdmmLe78d4WziZjHVmH
         7F1w==
X-Forwarded-Encrypted: i=1; AJvYcCW2Ie3g2geYoaXvRLPFdBMdm4w1ZI83gZ3Gn/gYa2K1gnuURpZHvcCVGJt0VuJENwMJ58FnTmnSSwC1CNzpg+d25oC8Rzeyu1ry0vaLbA1Q
X-Gm-Message-State: AOJu0Yx/JNhrOaV86z97283TgAJnTs8Jzu6wG07b409Db1F8Iru3AYxV
	MlN60KeMwXXCTOwpAEPCLu1NEgSjefABum7hzXxgdO5VlxvjIQYWvU1d/Pih/dwpfk5O0j/rrNw
	SFi9yoyw119cCALB2uLsWdo+G6j6gLf0LkB7H
X-Google-Smtp-Source: AGHT+IHX6Dw13lvp9tA5r1Nr3EDVBrqZjzt46+AZrMqkD9VDrFcqyfsc9zQwLVqS3nH7c8fc7LBij/O5GqbVZ/GRwBU=
X-Received: by 2002:a05:6402:350c:b0:582:f117:548e with SMTP id
 4fb4d7f45d1cf-5832c353bf0mr116598a12.0.1719364915083; Tue, 25 Jun 2024
 18:21:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240624232718.1154427-1-edliaw@google.com> <20240625135234.d52ef77c0d84cb19d37dc44f@linux-foundation.org>
 <f975fe76-92f4-4af0-a91d-0f3d8938f6b2@linuxfoundation.org> <CAG4es9V0XAqe-eqPgjU+sdRS00VOEr0Xda1Dv-gtfEvqsODjiw@mail.gmail.com>
In-Reply-To: <CAG4es9V0XAqe-eqPgjU+sdRS00VOEr0Xda1Dv-gtfEvqsODjiw@mail.gmail.com>
From: Edward Liaw <edliaw@google.com>
Date: Tue, 25 Jun 2024 18:21:27 -0700
Message-ID: <CAG4es9WHUSC7qm_6fJjQm5nM_iYEjXO75DWC8e5tzqc7fLEtfw@mail.gmail.com>
Subject: Re: [PATCH v6 00/13] Centralize _GNU_SOURCE definition into lib.mk
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kselftest@vger.kernel.org, 
	Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Fenghua Yu <fenghua.yu@intel.com>, 
	Reinette Chatre <reinette.chatre@intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	linux-kernel@vger.kernel.org, usama.anjum@collabora.com, seanjc@google.com, 
	kernel-team@android.com, linux-mm@kvack.org, iommu@lists.linux.dev, 
	kvm@vger.kernel.org, netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-sgx@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_182201_993831_51AEBA49 
X-CRM114-Status: GOOD (  20.20  )
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

T24gVHVlLCBKdW4gMjUsIDIwMjQgYXQgNTo0MeKAr1BNIEVkd2FyZCBMaWF3IDxlZGxpYXdAZ29v
Z2xlLmNvbT4gd3JvdGU6Cj4KPiBPbiBUdWUsIEp1biAyNSwgMjAyNCBhdCA0OjM04oCvUE0gU2h1
YWggS2hhbiA8c2toYW5AbGludXhmb3VuZGF0aW9uLm9yZz4gd3JvdGU6Cj4gPgo+ID4gT24gNi8y
NS8yNCAxNDo1MiwgQW5kcmV3IE1vcnRvbiB3cm90ZToKPiA+ID4gT24gTW9uLCAyNCBKdW4gMjAy
NCAyMzoyNjowOSArMDAwMCBFZHdhcmQgTGlhdyA8ZWRsaWF3QGdvb2dsZS5jb20+IHdyb3RlOgo+
ID4gPgo+ID4gPj4gQ2VudHJhbGl6ZXMgdGhlIGRlZmluaXRpb24gb2YgX0dOVV9TT1VSQ0UgaW50
byBsaWIubWsgYW5kIGFkZHJlc3NlcyBhbGwKPiA+ID4+IHJlc3VsdGluZyBtYWNybyByZWRlZmlu
aXRpb24gd2FybmluZ3MuCj4gPiA+Pgo+ID4gPj4gVGhlc2UgcGF0Y2hlcyB3aWxsIG5lZWQgdG8g
YmUgbWVyZ2VkIGluIG9uZSBzaG90IHRvIGF2b2lkIHJlZGVmaW5pdGlvbgo+ID4gPj4gd2Fybmlu
Z3MuCj4gPiA+Cj4gPiA+IFllcywgcGxlYXNlIGRvIHRoaXMgYXMgYSBzaW5nbGUgcGF0Y2ggYW5k
IHJlc2VuZD8KPiA+Cj4gPiBTaW5jZSB0aGUgY2hhbmdlIGlzIGxpbWl0ZWQgdG8gbWFrZWZpbGVz
IGFuZCBvbmUgc291cmNlIGZpbGUKPiA+IHdlIGNhbiBtYW5hZ2UgaXQgd2l0aCBvbmUgcGF0Y2gu
Cj4gPgo+ID4gUGxlYXNlIHNlbmQgc2luZ2xlIHBhdGNoIGFuZCBJIHdpbGwgYXBwbHkgdG8gbmV4
dCBhbmQgd2UgY2FuIHJlc29sdmUKPiA+IGNvbmZsaWN0cyBpZiBhbnkgYmVmb3JlIHRoZSBtZXJn
ZSB3aW5kb3cgcm9sbHMgYXJvdW5kLgo+Cj4gU291bmRzIGdvb2QsIEkgc2VudDoKPiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9saW51eC1rc2VsZnRlc3QvMjAyNDA2MjUyMjM0NTQuMTU4NjI1OS0x
LWVkbGlhd0Bnb29nbGUuY29tCgpJIHJlYWxpemVkIHRoYXQgaW4gdGhpcyB2NiBwYXRjaCwgSSBo
YWQgYWNjaWRlbnRhbGx5IHNlbnQgaXQgaW4gdGhlCm1pZGRsZSBvZiBhIHJlYmFzZSwgc28gaXQn
cyBtaXNzaW5nIHRoZSBsYXN0IGNoYW5nZSB0bwpzZWxmdGVzdHMvdG1wZnMuICBJJ3ZlIGZpeGVk
IGl0IGluIHY3LgoKPgo+ID4KPiA+IHRoYW5rcywKPiA+IC0tIFNodWFoCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
