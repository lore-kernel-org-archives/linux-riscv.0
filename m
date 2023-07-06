Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AE0EEB64D9
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Jul 2023 10:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U92xbcxZZVaH5foCeRZPzjZueCXd9Y5RLOG0SSnVXTk=; b=kwtd/AfJvpCLG2
	0IRGm4+BxtUHuo8zYKlav8AlCImYsiHgOg1YvoXnAzk1mG2LwnuVzFD3PyZtCbrXHJruerFJUo0ST
	mZr8Xs3MR8978rNzWpq8tsyG2aYDnrJgCHdT3cP23JmxUttkyZR0jvimQdY3WnhMhHFF92zLlExuq
	1z/GEVbtX2WjxiGcE3yhmU8t0XC4/uvTzDCvpXt0O9MMOmOYkBurELO9c2i2lxf9cY1U3WL5i/dWG
	dK/5+Q1mJx3Z4p7XkiKFj1SyLzR9pI1uJavL3WgVrrfARTyrgvQyD/uprQ7YxkgUdI4GrfkUpw/io
	ju0TxHPHzcU2lMz6KlCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHLwt-001Agi-2x;
	Thu, 06 Jul 2023 10:10:55 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHLwr-001Afb-0z
	for linux-riscv@lists.infradead.org;
	Thu, 06 Jul 2023 10:10:54 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-6b8b8de2c6bso446154a34.0
        for <linux-riscv@lists.infradead.org>; Thu, 06 Jul 2023 03:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688638251; x=1691230251;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kx3DJGY59x5qx6tz/6ohgRRDY+wGMD0R71MPKdi07jo=;
        b=e8JMwlQPc+gYtBBRJboS3hfvsvTzqhyQl/9DfKQ/ICXRvm+KBVL6eTQsy7TnDuim6c
         ICpVe0GMEFUUOaCVxpEgkeSa1EqCY5TBbHcFrHznap9MOrWm6S2a/o37IPxUwvpSSqn2
         9WgeuHBbKZNdakQyN13zlxNYAD481745dO0s+raSBgmId5UVUx65Cszavj24XDb1bzGy
         5/ntYG+cKy3V6vHp5EY6UDJRNi3isfI4rKSW0maZUzj8G8aij+ztvYKhp5xvWRAmNRxm
         ao/cHpqrnzb3ACc3MTYFbpyEnpYzLkeDMzNuP0q9hK93auW/HS4NyAAexFPu3kffe1GK
         bDsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688638251; x=1691230251;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kx3DJGY59x5qx6tz/6ohgRRDY+wGMD0R71MPKdi07jo=;
        b=dgQqZcH+Izdam9SS6d/BUaqPL0aq8hT7rTMkIkeqWqRAOisBmcOKP2IyNQcAzCEzuG
         RL2r096Hhm9IPd4GXU96PNCNVtR7r5VqYHo1+uqSLRmQBhVBkbAXZg2XmSQyAuBrXA9O
         FdxKN4i7S+caPurGTk2Bjm/5aeu7xjEdjfPE5kBdkUPQJblwzCL0Ty1asCL2ZZssnWKy
         UINv0t2YEmzGrN6/+6n6V8HFOWot/e6Tlj0A+6t+4MAtTgAjG5+joLzhDN+JlM1FyKR4
         4Wbu4DoDF2VBzcFz0rnn1x2j/tcr+dNmokwbbux5+k3raxj3Wdd5L5jk3TvJbgtVrLN2
         N0dw==
X-Gm-Message-State: ABy/qLbEN58lnOw10Rp96S8epmakhfmjDC1pyN09Xtos+RZ9YE2fKteY
	QuQxlZiMnr+6lTLbbdYOMR0=
X-Google-Smtp-Source: APBJJlF31OKCVWJMZ6cBjLI34YgMbSK7Y/GYtRBcrZgl/d++hencuN8S5/dGoWXZjBhpnBYiFOecwg==
X-Received: by 2002:a05:6358:9910:b0:134:ddad:2b4f with SMTP id w16-20020a056358991000b00134ddad2b4fmr1792759rwa.18.1688638250907;
        Thu, 06 Jul 2023 03:10:50 -0700 (PDT)
Received: from [0.0.0.0] ([5.180.77.117])
        by smtp.gmail.com with ESMTPSA id c10-20020a62e80a000000b00658670ebe7dsm954738pfi.119.2023.07.06.03.10.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jul 2023 03:10:50 -0700 (PDT)
Message-ID: <62ddcb9d-ecb2-f2bf-9709-fd02584b4af8@gmail.com>
Date: Thu, 6 Jul 2023 18:10:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH V11 0/5] riscv: Optimize function trace
To: Conor Dooley <conor.dooley@microchip.com>,
 Song Shuai <suagrfillet@gmail.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 rostedt@goodmis.org, mhiramat@kernel.org, mark.rutland@arm.com,
 guoren@kernel.org, bjorn@rivosinc.com, jszhang@kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org
References: <20230627111612.761164-1-suagrfillet@gmail.com>
 <c7090e76-b054-1f0d-8c05-18f041904b22@gmail.com>
 <20230706-crumpet-chemist-84b1dce8b155@wendy>
From: Song Shuai <suagrfillet@gmail.com>
In-Reply-To: <20230706-crumpet-chemist-84b1dce8b155@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_031053_341639_6BC47650 
X-CRM114-Status: GOOD (  12.32  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgrlnKggMjAyMy83LzYgMTc6NTMsIENvbm9yIERvb2xleSDlhpnpgZM6Cj4gT24gVGh1LCBKdWwg
MDYsIDIwMjMgYXQgMDU6MzU6NDlQTSArMDgwMCwgU29uZyBTaHVhaSB3cm90ZToKPj4gUGluZy4u
Lgo+IAo+IEEgY29udGV4dC1sZXNzIHBpbmcgaXMgbm90IHZlcnkgaGVscGZ1bCAtIHdoYXQgYXJl
IHlvdSBsb29raW5nIGZvciBoZXJlPwo+IE1vcmUgcmV2aWV3cz8gRm9yIGV4YW1wbGUsIHNvbWVv
bmUgdG8gbG9vayBhdCA1LzU/ID4KClNvcnJ5IGZvciB0aGUgY29udGV4dC1sZXNzIHBpbmcuIEkg
aG9wZWQgc29tZW9uZSBjb3VsZCBsb29rIGF0IHRoZSA1dGggCnBhdGNoLgoKPj4g5ZyoIDIwMjMv
Ni8yNyAxOToxNiwgU29uZyBTaHVhaSDlhpnpgZM6Cj4gCj4gSWYgaXQncyBhcHBsaWNhdGlvbiB5
b3Ugd2FudCwgeW91IHNlbnQgdGhlIHBhdGNoIG9ubHkgbGFzdCB3ZWVrIC0gd2hpY2gKPiB3YXMg
ZHVyaW5nIHRoZSBtZXJnZSB3aW5kb3csIG1ha2luZyBpdCB1bmxpa2VseSB0byBiZSBhcHBsaWVk
Lgo+ICA+IEVpdGhlciB3YXksIHBsZWFzZSB0cnkgdG8gZXhwbGFpbiB3aGF0IGl0IGlzIHRoYXQg
eW91IGFyZSBsb29raW5nIGZvcgo+IHdoZW4geW91IGRvIGEgcGluZyEKClRoYW5rcyBmb3IgeW91
ciBjb3JyZWN0aW9uLCBJJ2xsIGZvbGxvdyB0aGlzIHRocmVhZCBhZnRlciB0aGUgbWVyZ2UKd2lu
ZG93IGNsb3Nlcy4KCj4gCj4gQ2hlZXJzLAo+IENvbm9yLgo+IAoKLS0gClRoYW5rcwpTb25nIFNo
dWFpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
