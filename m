Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 324C2C2BD09
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jun 2024 20:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mJ4N85R2Z550Q363pLiKF5o+3Fawp9Wxj8kIzF2dCm4=; b=Tnfg3um03r+Yst
	HLXqZ43dFs6YykE0oLudxGUv0iq5qySoWdvrZngbAd13UlsAMFU2RU4laMLqqq5eQqDCsKVSs3Cvf
	RuuHIuuk3ImLUDkgK6V6Eg4UObh2ESfcC5Hhz7dnFl+nSpovsi3jCevDccPl0sJXIvz95yMaJqo+b
	c7C+FzPd31ZA8pJaqtainS6j8lOlYk3R4C35rZVGJFhRpu6EucqJAe2E0m7hy37hNukSSX+XkQ7to
	Ny+NfwROXza/5Tr1Kaj1NKgMgqQGCUzxLVrYsl2ShSg4hQXcZyBcfyGgJrSXXtjBS71Wu1GyuRC8P
	r4gDQFubw9gpKz5RWvDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLq9Q-00000000Xzt-0A7p;
	Mon, 24 Jun 2024 20:18:56 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLq9N-00000000XyH-3Gt1
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jun 2024 20:18:55 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-57cb9efd8d1so9337043a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 24 Jun 2024 13:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719260332; x=1719865132; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CYPMKzKXzPtEKhl5KLn1rsXOXuPsd77VL4h50H+aCL0=;
        b=MFgQ9QIUmKZ00skpho7vCTyzndoUA23Ebsij7eCq5EJXT2rcWNJuVUMl82VLiB6VKV
         +ofo94MQ8WS7LvXMdvvjMAkstNLVLHaXz2dTjgPHDHzlAsorIHY/Tcz/xdyrlhqwdIE8
         MyqWcX5cnFy3sWyIW93h1OniUeBBCInQA0sBYzIwQk3/u7MkUs5NUfWsy/7UNZBFP3+E
         8aUjEjdi4Ep6xNUtE7HWW9xi/7hpmyeCtooZylxPYrn8nzq/AA/aM8TqLs2Sw/i9g6RO
         8dY1NzGwxVGt7YHdpsY/EBNoK6KRmyZ06PFD2GSA4uOMqMCRDSfwCy06tNrFJrr1cIno
         u33g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719260332; x=1719865132;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CYPMKzKXzPtEKhl5KLn1rsXOXuPsd77VL4h50H+aCL0=;
        b=Y8LD7jmIpHuOpzFL/GokXlEyD8IeVVapJgY+IYMnEjSP3Y965RBDoc4mXkOjDpd/2P
         NHOmRvuo9XhsDi4V+HJpTogv9imhqBRkxIwaUGde2q1rLsC6SYbDVDcs8w4VqbU8sGBP
         ipjmpDFXeoqiabHf6n/bZdbNeAC7zrlBvQEmlEMDfjRYk0DqPh+01fLs5z0EWekkUbc9
         SLvH5GqsStbUM8Z6sbkmsmOOJc/Th5ikui4nJ795KoYY/a8d38QwlOXxpvkEmseMU08S
         JOJsbaFQUk5UNJ7Jc1Q0uVNd/iByDXFH8ifzwzJcMZDvBOfsHXb2lDJVffp8PByXhsue
         jr5g==
X-Forwarded-Encrypted: i=1; AJvYcCX8usMk2supsjQvm72mpOCHjpZ8iNMtBMcyvZaR8pQsMpGKnTky50Lg/ZSbeVK6S+ukwf7QzRXMvbbPBXfrO13VTCvYAJgiI9t/ZA1g91ZL
X-Gm-Message-State: AOJu0Yz2AwSt47Yb/g1K2r7+pcowdxcYJf3Z2LfNu4A57yLEgV0at3z+
	Fmg1fG0thpW2hstiRFxi8ld3+VziiEet2i0aDKUyNk54P/zSu/87RvMRMoOcUQYHRmfkIl0aAFD
	xlVyJVWXwlMVzcobuY3M95Y5pgnCPTDa5TF5/Yg==
X-Google-Smtp-Source: AGHT+IHYKa/ycS20058DIxTuE4TPZj+Ne6GJbbNiJ5FbYcQC6EiSPJWgGfnJ/EyOzoXs+/hcdQEshUVAiI2Wx8GhYRs=
X-Received: by 2002:a17:907:8b91:b0:a6f:6df5:a264 with SMTP id
 a640c23a62f3a-a70275ea47emr586904366b.1.1719260332160; Mon, 24 Jun 2024
 13:18:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240619113529.676940-1-cleger@rivosinc.com> <20240619113529.676940-15-cleger@rivosinc.com>
In-Reply-To: <20240619113529.676940-15-cleger@rivosinc.com>
From: Evan Green <evan@rivosinc.com>
Date: Mon, 24 Jun 2024 13:18:16 -0700
Message-ID: <CALs-HssLx_AZ_pBDECfVH7REoSkyz-=bECPYDeNZkfe59DdBGQ@mail.gmail.com>
Subject: Re: [PATCH v7 14/16] riscv: hwprobe: export Zcmop ISA extension
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Anup Patel <anup@brainfault.org>, 
	Shuah Khan <shuah@kernel.org>, Atish Patra <atishp@atishpatra.org>, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_131853_846623_6328C92C 
X-CRM114-Status: UNSURE (   5.64  )
X-CRM114-Notice: Please train this message.
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

T24gV2VkLCBKdW4gMTksIDIwMjQgYXQgNDo0MeKAr0FNIENsw6ltZW50IEzDqWdlciA8Y2xlZ2Vy
QHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBFeHBvcnQgWmNtb3AgSVNBIGV4dGVuc2lvbiB0aHJv
dWdoIGh3cHJvYmUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckBy
aXZvc2luYy5jb20+CgpSZXZpZXdlZC1ieTogRXZhbiBHcmVlbiA8ZXZhbkByaXZvc2luYy5jb20+
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
