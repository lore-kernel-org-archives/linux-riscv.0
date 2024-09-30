Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71EC3CE8356
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Sep 2024 14:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KX4RhvAZ7KBROH5R5gtVqNNIpJh5IwbiH2iYmGZ+fbo=; b=FP2IhNUHMVXxai
	IVzPv08R8xXz1M28JA+2VuS+NALlEjRWc9aIlcFTp6eb1i/7bz7KvmnLfGiOABkOgXYXKiBGboEW7
	A3gtWg104hvZsaWThHvUXgyT1irCI3p7ZxIh4XHS+bmaB8k9RTUsErK0zYZPKQjMgfhwZ2Za/vujo
	vNXiD0AVbwa3NoFFJquabFgpIZd0sTa6yQI38Xit+ltp+8gzvN8lhfJnXQHM1rYsBnq8zMNzY/th6
	74bjLKivsDM25DzG0sPE2R+sQv37COwYAu0CM5pf817TtHOLZ9dvV9JvObirzHXHj8rPaz8LfCwgw
	Eg+qZYCb17itrwMfp+0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svHo4-0000000Ha18-4618;
	Mon, 30 Sep 2024 14:55:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svHnL-0000000HZqB-0ZSW
	for linux-riscv@bombadil.infradead.org;
	Mon, 30 Sep 2024 14:54:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:MIME-Version:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=ALPW1k0LbTsXa59WeZeOJq/eqV4KupMSswfZf48GPws=; b=Bwthe1f6cLPbHx23iSLur7DclO
	iJO6i+LCAT4SLQKRrqLp1Q58oHLQRCK7bSM3Zq38p60yHYBu43n13hQj0/wVVzfbGCD/3zpogwqA/
	7hgR0EohIFiIDYnAO6lxS6QlKVrUZQRyThZitD+ICKYfQGe04AO4aeWKMnPYoV0FvYAjaf/RM2Jwt
	WQDeSfvVqsaWyz62dJitSDT1BsE1T239sh9ih9JWRzeZwMyoBs6by02Q0+sxlfbRaPevTRC8QTZsF
	Ea9R6Duft+MNaBno7SxXbfJzZNh4X74DYOqsgAAWNx5HkMrKUtFItpgGeOgrsAlYJXUMsL7jTI8hR
	r9GQJqCQ==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svHnH-00000002qiv-2hPo
	for linux-riscv@lists.infradead.org;
	Mon, 30 Sep 2024 14:54:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EABBEA420F7
	for <linux-riscv@lists.infradead.org>; Mon, 30 Sep 2024 14:54:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BB4AC4AF0B
	for <linux-riscv@lists.infradead.org>; Mon, 30 Sep 2024 14:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727708071;
	bh=/JWk2c3RJLiKkNr4uJaQal5/fmki64lMPPToa0iog7E=;
	h=From:Date:Subject:To:Cc:From;
	b=b7FizeENg77MKbom+2zTJGU4IpbLDyRzueqz1pgn11Erca+an93XR6UMqbg2hXPlZ
	 j0esz+ZmB/8TGmA5iy2uWPppf6EooooreE9qFvYxdz8zBu9PJPEhtcDrklPRD0yizi
	 1K55z5c38G5J+v5DHSSeQ02nMehByrHdTh79CLJFLOgvioQthmDjuj9dPkHvHQkqHr
	 WhlXzvfSjmBWC5GNYgCApK6AjkqmXS/WtY2ItGap7lcxk3bxIYQgwX/M1JYdcUsGDZ
	 /9GgOnVUrt2BZtw4RPS3EuckC31dSuKYFIZfFfZEWgBYP0KihLD2aeFibHwTi2Ho0Z
	 koTKf/908iLww==
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6cb2e5d0104so33454886d6.3
        for <linux-riscv@lists.infradead.org>; Mon, 30 Sep 2024 07:54:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWtO7MDMWpmOESNWx8Ql5dh1N/6TKktOAUjnCOxt3BAQu3UNoeU2xyu2gLz9gZkaO3MGij7Cvsb+rLn7Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzS0OyYvrOCJVXFUOKf5tmfhP7Ua8zducqS3HsWclNHHkO4zFK1
	njojF/hkHOA4rsiVMfmzCvxWhLj8p40IPPiUt3YwRBVPml/BHlcoltLhBELth5to0AaAOegbonF
	7MEizut9e3v8ZcYgiFMO1zJozMe4=
X-Google-Smtp-Source: AGHT+IH/4DZQp0uzTsMI40zAn+1n2UViUSzRuwG37vCHfnoR2MSpWkb0k5JZSIt5ebWGcwB4s3FMVmIQSsDEap60QEA=
X-Received: by 2002:a05:6214:4519:b0:6cb:5f8a:4fda with SMTP id
 6a1803df08f44-6cb5f8a54e0mr66594666d6.6.1727708070837; Mon, 30 Sep 2024
 07:54:30 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Date: Mon, 30 Sep 2024 16:54:19 +0200
X-Gmail-Original-Message-ID: <CAJ+HfNjwqMhAFUvKRsWEAD1BZNC19ouYmJ9XMNP2HrcyKo6Ltg@mail.gmail.com>
Message-ID: <CAJ+HfNjwqMhAFUvKRsWEAD1BZNC19ouYmJ9XMNP2HrcyKo6Ltg@mail.gmail.com>
Subject: Github RISC-V CI (BoF follow-up)
To: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	linux-riscv <linux-riscv@lists.infradead.org>
Cc: Charlie Jenkins <charlie@rivosinc.com>, Conor Dooley <conor@kernel.org>, 
	Samuel Holland <samuel.holland@sifive.com>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
	Drew Fustini <dfustini@tenstorrent.com>, Arnd Bergmann <arnd@arndb.de>, 
	LKML <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_155436_063586_F247BAB9 
X-CRM114-Status: GOOD (  11.62  )
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

SGksCgpGb2xsb3dpbmcgdXAgb24gdGhlIGRpc2N1c3Npb24gYXJvdW5kIENJIHRoYXQgY2FtZSB1
cCBkdXJpbmcgUGx1bWJlcnMKUklTQy1WIEJvRi4KClRMO0RSOiBUaGVyZSdzIGEgQ0kgcnVubmlu
ZyBidWlsZHMvYW5kIHRlc3RzIGZvciBSSVNDLVYuIENoZWNrIG91dCBbNF0sCmlmIHlvdSdyZSBh
IG5pY2UgcGVyc29uLCB0cnkgdG8gZml4IHdoYXQncyBicm9rZW4uCgpMb25nIHZlcnNpb246IEFz
IG1vc3Qgb2YgeW91IGtub3cgdGhlcmUgYXJlIGEgbnVtYmVyIG9mIExpbnV4IGtlcm5lbApDSXMg
b3V0IHRoZXJlLCB0aGF0IGJ1aWxkL3Rlc3Qgc29tZSBhcmVhcyBvZiBSSVNDLVYuIGtlcm5lbGNp
IGRvZXMKc29tZSwgYW5kIExpbmFybyBMS0ZUIHNvbWUuCgpZZXQgYW5vdGhlciBDSSBydW5zIGlu
IHBhcmFsbGVsIHRvIHRoZSBSSVNDLVYgUGF0Y2h3b3JrIENJIG9uIEdpdGh1YiwKcnVubmluZyBv
biB0aGUgUklTRSBzcG9uc29yZWQgcnVubmVycyBbMV0uCgpBIG1ham9yIHBpZWNlIG1pc3Npbmcg
aXMgYSBzdW1tYXJ5L2Rhc2hib2FyZCBwYWdlLiBUaGF0J3Mgc3RpbGwgaW4gdGhlCnBsYW5uaW5n
IHBoYXNlLiBJJ2xsIGJlIGxvb2tpbmcgaW50byB3aGF0IHRoZSBrZXJuZWwgQ0kgZm9sa3MgYXJl
Cm9mZmVyaW5nIGluIHRoYXQgc3BhY2UgKEtDSURCKS4KClRoZSBDSSBwdWxscyBpbiBhIGNvdXBs
ZSBvZiBicmFuY2hlcywgZS5nLiBMaW51cycgbWFzdGVyLCBQYWxtZXIncwpzdGFnaW5nIGJyYW5j
aGVzLCBhbmQgbW9yZS4gQWxsIGJyYW5jaGVzIGFyZSBsaXN0ZWQgdmlhIHRoZSBQUnMgaGVyZQpb
NF0uCgpUaGVyZSBhcmUgdHdvIHdvcmtmbG93cyBjaS1zZXJpZXMgKGJ1aWxkIGFuZCBib290KSwg
YW5kIGZvciBicGYsCmJwZi1uZXh0LCBhbmQgTGludXMnIG1hc3RlciBjaS1rc2VsZnRlc3QgaXMg
cnVubmluZyBhcyBhbiBleHBlcmltZW50LgpJJ2xsIGJlIGFkZGluZyBrc2VsZnRlc3QgdG8gdGhl
IG90aGVyIGJyYW5jaGVzLCBhbmQgYSBjb3VwbGUgb2Ygb3RoZXIKc3VpdGVzIG9uY2Ugd2UgZ2V0
IG1vcmUgYnVpbGQgbWFjaGluZXMsIGFuZCB0aGUgdGVzdHMgYXJlIHNvbWV3aGF0Cm1vcmUgc3Rh
YmxlLiA7LSkKCkFsbCB0aGUgYnVpbGRzIGFyZSBjcm9zcyBjb21waWxlZCwgYW5kIHRoZSB0ZXN0
cyBhcmUgcGVyZm9ybWVkIG9uCnFlbXUuIEl0J3MgYWxsIHJ1biBpbiBhIERvY2tlciBjb250YWlu
ZXIgWzNdLCB0aGF0IGNhbiBiZSBwdWxsZWQgd2l0aDoKCiAgJCBkb2NrZXIgcHVsbCBnaGNyLmlv
L2xpbnV4LXJpc2N2L3B3LWJ1aWxkZXI6bGF0ZXN0CgpUaGUgR2l0aHViIENJIHNjcmlwdHMgKGFn
YWluLCBzaGFyZWQgd2l0aCBQYXRjaHdvcmspIHJlc2lkZSBoZXJlIFsyXS4KCkVhY2ggdGltZSBh
IHRyZWUgbW92ZXMsIGEgbmV3IGJ1aWxkIGlzIHBlcmZvcm1lZC4gU29tZXRpbWVzLCB0aGUgdHJl
ZQptb3ZlcyBiZWZvcmUgdGhlIGpvYiBpcyBkb25lLiBJbiB0aGF0IGNhc2UgaXQncyBjYW5jZWxs
ZWQsIGFuZCByZS1ydW4Kb24gdGhlIG5ldyBoZWFkLgoKQnVpbGQvYm9vdDogQSA2LjEyLXJjMSBy
dW4gaXMgaGVyZSBbNl0uIFRoZSBsb2cgYXJ0aWZhY3RzIGFyZSBhdCB0aGUgYm90dG9tLgpDbGlj
ayAiYnVpbGQtc2VyaWVzIiwgYW5kIGV4cGFuZCAiUnVuIGNoZWNrcyIgZm9yIG1vcmUgZGV0YWls
cyAob3IKY2hlY2tvdXQgdGhlIGxvZ3MpLgoKS3NlbGZ0ZXN0OiBBIDYuMTItcmMxIHJ1biBpcyBo
ZXJlIFs1XS4gVGhlIGtlcm5lbCBjb25maWd1cmF0aW9uIGlzCmRlZmNvbmZpZytrc2VsZnRlc3Qt
bWVyZ2UgKHBsdXMgc29tZSBhZGRpdGlvbmFsIGJhbmRhaWQgcGF0Y2hlcyB0aGF0CmhhdmVuJ3Qg
bWFkZSBpdCB0byBtYWlubGluZSBbN10uIFRoZSB0ZXN0IHN1aXRlcyBpbmNsdWRlIGV2ZXJ5dGhp
bmcKdGhhdCdzIGV4cGxpY2l0bHkgaW4gVEFSR0VUUyAodG9wIGtzZWxmdGVzdCBNYWtlZmlsZSks
IGFuZCB0aGF0IGhhcwpjcm9zcyBjb21waWxlIHN1cHBvcnQgKGUuZy4gTk9UIHNjaGVkX2V4dCB5
ZXQgOy0pKS4KCkRvd25sb2FkIHRoZSBsb2dzIGZyb20gWzVdLCBhbmQgdGhlbjoKCiAgJCBlZ3Jl
cCAtYSAnXlRFU1R8Xm5vdHxLZXJuZWwgcGFuaWMnICpfX2tzZWxmdGVzdHssLWJwZiwtbmV0LC1m
dHJhY2V9LmxvZwoKdG8gdmlldyB0aGUgZmFpbGVkIHRlc3RzLiBPbiA2LjEyLXJjMSB0aGUgZnRy
YWNlIHN1aXRlIHBhbmljcyEgOi1QCgpJdCdzIGZhciBmcm9tIHBlcmZlY3QsIGFuZCB3ZSdyZSBz
dGlsbCBub3QgcnVubmluZyBlbm91Z2ggKEFGQUlLKSB0ZXN0cyBvbgpyZWFsIEhXLCBidXQgaXQn
cyBzb21ldGhpbmcgdGhhdCdzIGF2YWlsYWJsZSBub3cuIFBhdGNoZXMgYXJlICp3ZWxjb21lKgpY
LUQuCgoKQmrDtnJuCgpbMV0gaHR0cHM6Ly9naXRodWIuY29tL2xpbnV4LXJpc2N2L2xpbnV4LXJp
c2N2ClsyXSBodHRwczovL2dpdGh1Yi5jb20vbGludXgtcmlzY3YvZ2l0aHViLWNpLwpbM10gaHR0
cHM6Ly9naXRodWIuY29tL2xpbnV4LXJpc2N2L2RvY2tlcgpbNF0gaHR0cHM6Ly9naXRodWIuY29t
L2xpbnV4LXJpc2N2L2xpbnV4LXJpc2N2L3B1bGxzP3E9aXMlM0FwcitpcyUzQW9wZW4rdGVzdCU1
RApbNV0gaHR0cHM6Ly9naXRodWIuY29tL2xpbnV4LXJpc2N2L2xpbnV4LXJpc2N2L2FjdGlvbnMv
cnVucy8xMTA5NjM4Nzg2MwpbNl0gaHR0cHM6Ly9naXRodWIuY29tL2xpbnV4LXJpc2N2L2xpbnV4
LXJpc2N2L2FjdGlvbnMvcnVucy8xMTA5NjM4Nzg1OApbN10gaHR0cHM6Ly9naXRodWIuY29tL2xp
bnV4LXJpc2N2L2dpdGh1Yi1jaS90cmVlL21haW4vLmdpdGh1Yi9zY3JpcHRzL3Nlcmllcy9wYXRj
aGVzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
