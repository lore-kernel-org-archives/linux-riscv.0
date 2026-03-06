Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73560F51415
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Mar 2026 07:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WYpvk7BckhBYjdD2dwrjBMg+C0iqQErPIaGunWUJs+Y=; b=WfUE3FZ3dEe7CK
	xO4oLVLmfmW73usXZO7iRtH6zm1qhDRW+SBNZDT51ve3eOdVZWqhKtItQy0SwrV8rKS4SpeihvhoP
	Vor39EiMzOTpPNICOxxIOaac9vqw/mdDcsBvgfHSGfC/TJeFw6tL5MEOwm6txQIEbzCqZfs1hM8FQ
	dvEJhHKNMJf4GOgqPJliquYrQpETYgrap48NaRtpzidUw2cpEpoR1Y+IKNnUQ7hfEwS9MJntAuAVR
	L5GkCO/wNYivSIpmp0pg/09X2Hw29kh+E5r9imZg8QnD09bY+Y9mr2AWmdC42UnpYmeOKVIEi0jIV
	4ufmknhsXC3l3U4hjGng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyPEl-000000037ak-2PRi;
	Fri, 06 Mar 2026 07:04:39 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyPEi-000000037ZA-0YfV
	for linux-riscv@lists.infradead.org;
	Fri, 06 Mar 2026 07:04:38 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-7d598f4b6fdso2828213a34.1
        for <linux-riscv@lists.infradead.org>; Thu, 05 Mar 2026 23:04:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772780675; cv=none;
        d=google.com; s=arc-20240605;
        b=L4xXV4Cbzrq82lUzzIAsWYtr7QfD7SO9aJ39Nlpv4h2H1wnLXb1PEVG+JZIwxhL4/d
         1mwUvPC/c5XqenSjN6mQzxfk+4+eFk5gGwzVODXI/GAPuOGmgWYgcqBnnteqCEnI4+2a
         9Gdw1LO0XGi4XbgSlR6Qg0FD7ynPsZuxANQ79zIBdhxYn8UVuHwyvdn/zFEY5PH00yqx
         mLHVdi5o3n9n9xj2PjfsnADZ5/6gFPXMbW54cUD9E2eUsmRtkPk/vHgEnJX8iPw+Habj
         YuO3V5wXkbfoDSjG410v8Fc1qDbSGdoB7jSlHxEMhxoL8jj++1ugjhgPrRUMBsDi6u99
         +5yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ivXnTCaqI3lRQ19wdmdY/Vg2LOO+anvFx2bukYGj6N0=;
        fh=TPwq0AmvpJTEmJusferkVgJfDxU22/OMS8Cbo1ya1lo=;
        b=I7LDHAqIyMjWFgiFbg7bzZVZSgwoRGt80OoeIh18KlV9NnWFtdb/kvvZPUpG+Z3t5b
         4Ol/F8PuG8b/S9YxB48D7t9ioFmWXYMpNLycjwoKrVANX3n3X9CjEp5kC8XCmxtQ6Zva
         bK0e5ricx1rGUdWNVjehZkN4ZpSHTjgEIOYWD62OuwbO6gmzcQFFPZD6pveBunLzcWQc
         uO/O15FvGtGLWwRsgHWEEjWXzgKvJf5HL/lj+aMW4WjZ6k3jtumXP7RyzUxDCJfJEWZd
         DblHrgVGegzbnbBDw8888KABHIdq1T0ouCZATYCFiQ/7+OIhUcZClIEH7enTk0xuD6Yk
         Kkdw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1772780675; x=1773385475; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ivXnTCaqI3lRQ19wdmdY/Vg2LOO+anvFx2bukYGj6N0=;
        b=IiirU3JUbnx7C1pqy4wlmdve3OqpqHPM15g/cPapIaQQG8NmWJFkZPrwUpoo7Ke3O+
         mAB4KCzUCdlxW23kcrp0TeD7KnDTAZEa/umbwBT0tHe237bUNh7BbsHR+3/hbeakx/uC
         y6bzEXaYvOOlkQLnrzbvoOA2sEkQMGD6SQd180wd+Y4U3ArJvrYyuxY/HvzO9xUhI9J5
         1J5chZCFnRy/bRO8Nff4SUyW4bY7OlsPwHACXDTyTIiBdWYr5IGp2p5zs9o1clarJ6n/
         jZOuI0TUB1l4NkDJalmZ86VOquhg8Zf1MTQzRmmmhDcbKh79OMB2QIo10Fn48RVLn09f
         sfaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772780675; x=1773385475;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ivXnTCaqI3lRQ19wdmdY/Vg2LOO+anvFx2bukYGj6N0=;
        b=nAXU9nCR7yMCYtZG77x/tVSuvY7SbvlN4ykJe99sZDDIsUIK3OEdguWa7hHmi2oifg
         +5aR08m4pSCeFApofN2nJLk6tmNrqIrh6H8lsCNJchzdryMNWGY2g0KhNZUcsN2QL7t/
         g+F8Y9LqLHT+SPmXnUEjZBQghVjOm8p4L2UUQ/fIyL9CmNb1K/YZk4PvKeN+JOFaK39K
         NH20v0cNOdAAIHQT9y1gsKguyF/owdoBksdisyvPdJFx7WbFg9x17bDsEh7hf+QBRkD7
         8G62/bIDvm0Frwf80FJe3ssZukHA+WHJfKGK1YL0zNsTkyhBYNw0FyhqUbvH7vFAsl9u
         QdRw==
X-Forwarded-Encrypted: i=1; AJvYcCWANbEm9DaakAPjFLZEQj/peouJzgaUTYw9kEP29WS/NM7Z4ebEXHc4HQ6/XYye1juGZFRYzlgfwy8dxA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwXpfBA2c2pXnlS1m0Q8X1b5hNKDucHoH1YSh/hvNXPX4H8TNMm
	3YSgBGvkFPeHJ+kI8EX9sW1JGQNs3ZZoS7HZR7D4QgX0mJguIOqMaLDMRgM4dY6vBMJEKQKVgjL
	wx//dOshC/RVeYdj2wxyJGdZzySeemBCuvYVHmzFd2Q==
X-Gm-Gg: ATEYQzxY3ToSjFDr1pCrsDFtqIKePopTCVpejE8FqsylbiQgJq5kMwcCpmkfYr9OwXg
	TBj+rOERPuS4pFYd7TwqqVyDXBTsvCXdu60NlSvnWp+sXoCj405fqXVeBllBM9qdJbQ8lKQyAk0
	U4Xim2qaGg6HpUFXt3Bk3oYTB/SkNpkhfZsFnHxhp0+SUbY0yYfnEQdmGdjNj6j0ZD3Ea6It84r
	rjkH8+/SSbLhxELeFZUu9rXVksxZdHstP/YZXdVgQ0xelvLXsp+rxMJdZCE30TFBygT+5Qdqqnz
	9KGHhjranWTPu7ia6hZYOVhwoUd4rnsVWStz6Ju95LnxcQd7gG8UhH7vQLNb3IULAijqErnPumd
	BuDBs/TQ3FGjxMIIfbVxv3lPAfw==
X-Received: by 2002:a05:6820:1787:b0:675:2e2e:569c with SMTP id
 006d021491bc7-67b9bca66c2mr902114eaf.25.1772780675004; Thu, 05 Mar 2026
 23:04:35 -0800 (PST)
MIME-Version: 1.0
References: <20260120080013.2153519-1-anup.patel@oss.qualcomm.com> <20260120080013.2153519-3-anup.patel@oss.qualcomm.com>
In-Reply-To: <20260120080013.2153519-3-anup.patel@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 6 Mar 2026 12:34:22 +0530
X-Gm-Features: AaiRm52sAuSfM9cJRWnAGnwsD5n99Tkn6MwnQdCUOUYqaB6vd5qGlGeCvH3Tt3k
Message-ID: <CAAhSdy1tMeD2k4DXNd3m_qgrD+VOOML2Rd_q-ykcLXPv0UzMiA@mail.gmail.com>
Subject: Re: [PATCH 02/27] RISC-V: KVM: Fix error code returned for Ssaia ONE_REG
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atish.patra@linux.dev>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, 
	Shuah Khan <shuah@kernel.org>, Andrew Jones <andrew.jones@oss.qualcomm.com>, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_230436_177759_6A6EE612 
X-CRM114-Status: GOOD (  13.63  )
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

T24gVHVlLCBKYW4gMjAsIDIwMjYgYXQgMTozMOKAr1BNIEFudXAgUGF0ZWwgPGFudXAucGF0ZWxA
b3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBSZXR1cm4gLUVOT0VOVCBmb3IgU3NhaWEgT05F
X1JFRyB3aGVuIFNzYWlhIGlzIG5vdCBlbmFibGVkCj4gZm9yIGEgVkNQVS4KPgo+IFRoaXMgd2ls
bCBtYWtlIFNzYWlhIE9ORV9SRUcgZXJyb3IgY29kZXMgY29uc2lzdGVudCB3aXRoCj4gb3RoZXIg
T05FX1JFRyBpbnRlcmZhY2VzIG9mIEtWTSBSSVNDLVYuCj4KPiBGaXhlczogMmE4OGYzOGNkNThk
ICgiUklTQy1WOiBLVk06IHJldHVybiBFTk9FTlQgaW4gKl9vbmVfcmVnKCkgd2hlbiByZWcgaXMg
dW5rbm93biIpCj4gU2lnbmVkLW9mZi1ieTogQW51cCBQYXRlbCA8YW51cC5wYXRlbEBvc3MucXVh
bGNvbW0uY29tPgoKUXVldWVkIHRoaXMgYXMgZml4IGZvciBMaW51eC03LjAtcmNYCgpSZWdhcmRz
LApBbnVwCgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS9haWEuYyB8IDQgKysrKwo+ICAxIGZpbGUg
Y2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0v
YWlhLmMgYi9hcmNoL3Jpc2N2L2t2bS9haWEuYwo+IGluZGV4IGRhZDMxODE4NTY2MC4uMzFiYWVh
OWYwNTg5IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL2FpYS5jCj4gKysrIGIvYXJjaC9y
aXNjdi9rdm0vYWlhLmMKPiBAQCAtMTgzLDYgKzE4Myw4IEBAIGludCBrdm1fcmlzY3ZfdmNwdV9h
aWFfZ2V0X2NzcihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCj4gIHsKPiAgICAgICAgIHN0cnVjdCBr
dm1fdmNwdV9haWFfY3NyICpjc3IgPSAmdmNwdS0+YXJjaC5haWFfY29udGV4dC5ndWVzdF9jc3I7
Cj4KPiArICAgICAgIGlmICghcmlzY3ZfaXNhX2V4dGVuc2lvbl9hdmFpbGFibGUodmNwdS0+YXJj
aC5pc2EsIFNTQUlBKSkKPiArICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9FTlQ7Cj4gICAgICAg
ICBpZiAocmVnX251bSA+PSBzaXplb2Yoc3RydWN0IGt2bV9yaXNjdl9haWFfY3NyKSAvIHNpemVv
Zih1bnNpZ25lZCBsb25nKSkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9FTlQ7Cj4KPiBA
QCAtMTk5LDYgKzIwMSw4IEBAIGludCBrdm1fcmlzY3ZfdmNwdV9haWFfc2V0X2NzcihzdHJ1Y3Qg
a3ZtX3ZjcHUgKnZjcHUsCj4gIHsKPiAgICAgICAgIHN0cnVjdCBrdm1fdmNwdV9haWFfY3NyICpj
c3IgPSAmdmNwdS0+YXJjaC5haWFfY29udGV4dC5ndWVzdF9jc3I7Cj4KPiArICAgICAgIGlmICgh
cmlzY3ZfaXNhX2V4dGVuc2lvbl9hdmFpbGFibGUodmNwdS0+YXJjaC5pc2EsIFNTQUlBKSkKPiAr
ICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9FTlQ7Cj4gICAgICAgICBpZiAocmVnX251bSA+PSBz
aXplb2Yoc3RydWN0IGt2bV9yaXNjdl9haWFfY3NyKSAvIHNpemVvZih1bnNpZ25lZCBsb25nKSkK
PiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9FTlQ7Cj4KPiAtLQo+IDIuNDMuMAo+CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
