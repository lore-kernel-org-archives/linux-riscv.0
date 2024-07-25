Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74961C3DA5D
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jul 2024 19:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8fepFu4vwovfiQ93m1/vBTrZGDxXObq9NaSj/PqKBPc=; b=4a/1Ohy/06kKJT
	gFK89yO2wroECsz7tLl/mnU47+woGo14j9QC8pNGmiywF7JhXgJH3SwRV7F1i9jrR/A/WB0fIdiJb
	p2sR/ODe1btioy7eLnMs8/Qr7GFybqiI92g60iybuJEhU49cO+83g+jKCcufdJ5lZi5bzZN0QdHiT
	wT66Nf7O/mB4IkS0lrSH1Ib/tW2SPAeaSFc/ZVNM0jlnuIA2yWWTsTJpDHeCfovpuUdJGjUQcsXpi
	YnNGi8gYdBYOaTVTJy3QquZQmbN49WRLZARsoEjGOSQkQzua0oulae/Gr7J0izEv3WZF0zO1t54ml
	5nHXvdw06bIT+pnHz5ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sX3ha-00000001qk5-2Ctm;
	Thu, 25 Jul 2024 19:00:34 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sX3hV-00000001qfn-3G6e
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jul 2024 19:00:31 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5a10bb7b237so1808573a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 25 Jul 2024 12:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721934028; x=1722538828; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AjVlzTF2LGrnSzM8/4XkZMhAnv6fs+uvqifqYuqWfq4=;
        b=R9zyUwvZfP0H8fXHQeIUtLbZucF85pnj0cs9ZC/oQn/PH8rLrThRD3qQhtvPHdhMVG
         X/duTMEV7CYHnAAKvOoSHaSmY4VMhOGfLAZiWhGNQZY5Fa7g6EziSyoXy74THW3/5Dt1
         Qal8pcbc7XOq8bVv7wy68+ghlxeO9xtALHIfRGZD/V+5tMGjdnwhXREbOlgpCpO/Wfks
         OI0GNzGl/rV1QJB2/F9l1KJunSH9DBCFAL8OwcQ1Wwfdpd7EUFOYY0DW3m9UHIQHtkI8
         Tz4JHGmR+rK4y73onLL1z4dV0jLlHewa/d4xr5zyqeF/Eq7M/kRZ6iH1yIxKZmxkFUuB
         JAVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721934028; x=1722538828;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AjVlzTF2LGrnSzM8/4XkZMhAnv6fs+uvqifqYuqWfq4=;
        b=uEuKnjlgBN4e+wWODkU7Q+Krg8Dkw79d0Vsfez7vtCWvAZh96AIfWhdFodZ8k5p2ka
         8qvCA/DU7ls3f9C41A3smIEV2Dnu7V/2vUrhMB4sZi9SPxyH4bsMOorRWGc/TCHW+oNc
         Nw0D6PWdoWzaKde5iiFbTFWgiSqitGYgvRC983KbL8IYh6zZvOjYKy83zgE8VmKd2ICH
         9YcwJrUDow1rwObXw3G9R8tKIzAndPylB3So+KHlBiQ3wQykky8GlIafTufwjjKcjkeu
         1TpmnA5n9OFMfXNk0yPTarZeo+UV8wmgaLEds0AZhrufgp4CZrm/JMQ0A0+O3Sts3X03
         bBrA==
X-Gm-Message-State: AOJu0YwMVst9kHSi6yqQGK4iGFq90Pa57WLFLzYZnTks8FOi6h8FfzZi
	i6Z8yRoXmbjoc3CVOU9oAIQIaew4bwdB0C1FjsOaAkcDLXTBWv3jrtuabrKu6Ze3z3YUwGaXkih
	yrLRwVpGI6ir/WSnM8u3UrI7dx5I3ku/CN2uK4Q==
X-Google-Smtp-Source: AGHT+IGWrT6AGOjft7fPxfyGvYvCXJfttPv/nEZHz0d3KcIR2jl3mOL7uB8g8yrYQBh2WMamTXYhqpV0NrzQOqbsGCE=
X-Received: by 2002:a17:907:9483:b0:a7a:af5d:f30b with SMTP id
 a640c23a62f3a-a7ac508ab79mr312568066b.66.1721934028544; Thu, 25 Jul 2024
 12:00:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240724183605.4038597-1-jesse@rivosinc.com> <20240724183605.4038597-5-jesse@rivosinc.com>
In-Reply-To: <20240724183605.4038597-5-jesse@rivosinc.com>
From: Evan Green <evan@rivosinc.com>
Date: Thu, 25 Jul 2024 11:59:52 -0700
Message-ID: <CALs-Hss0UpyR-NriR1egtBchssqRnhER=ND+4H1TbOk0PerS+Q@mail.gmail.com>
Subject: Re: [PATCH v6 4/8] RISC-V: Scalar unaligned access emulated on
 hotplug CPUs
To: Jesse Taube <jesse@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Xiao Wang <xiao.w.wang@intel.com>, Andy Chiu <andy.chiu@sifive.com>, 
	Eric Biggers <ebiggers@google.com>, Greentime Hu <greentime.hu@sifive.com>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Heiko Stuebner <heiko@sntech.de>, Costa Shulyupin <costa.shul@redhat.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Baoquan He <bhe@redhat.com>, 
	Anup Patel <apatel@ventanamicro.com>, Zong Li <zong.li@sifive.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Ben Dooks <ben.dooks@codethink.co.uk>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Erick Archer <erick.archer@gmx.com>, Joel Granados <j.granados@samsung.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240725_120029_854967_48822C1C 
X-CRM114-Status: GOOD (  11.06  )
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

T24gV2VkLCBKdWwgMjQsIDIwMjQgYXQgMTE6MzbigK9BTSBKZXNzZSBUYXViZSA8amVzc2VAcml2
b3NpbmMuY29tPiB3cm90ZToKPgo+IFRoZSBjaGVja191bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVk
KCkgZnVuY3Rpb24gc2hvdWxkIGhhdmUgYmVlbiBjYWxsZWQKPiBkdXJpbmcgQ1BVIGhvdHBsdWcg
dG8gZW5zdXJlIHRoYXQgaWYgYWxsIENQVXMgaGFkIGVtdWxhdGVkIHVuYWxpZ25lZAo+IGFjY2Vz
c2VzLCB0aGUgbmV3IENQVSBhbHNvIGRvZXMuCj4KPiBUaGlzIHBhdGNoIGFkZHMgdGhlIGNhbGwg
dG8gY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19lbXVsYXRlZCgpIGluCj4gdGhlIGhvdHBsdWcgcGF0
aC4KPgo+IEZpeGVzOiA1NWUwYmY0OWEwZDAgKCJSSVNDLVY6IFByb2JlIG1pc2FsaWduZWQgYWNj
ZXNzIHNwZWVkIGluIHBhcmFsbGVsIikKPiBTaWduZWQtb2ZmLWJ5OiBKZXNzZSBUYXViZSA8amVz
c2VAcml2b3NpbmMuY29tPgoKUmV2aWV3ZWQtYnk6IEV2YW4gR3JlZW4gPGV2YW5Acml2b3NpbmMu
Y29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
