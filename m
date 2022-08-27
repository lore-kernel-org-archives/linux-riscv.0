Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6AAAECAAD2
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Aug 2022 12:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pj93nCIM8OlsnMDuPMDh486seO5yfRU8w2pACgtHgqg=; b=yNYnBnF7lK9WJn
	HvBDZuvElsdorA77rTjjs9cm8eDgjPjSMOGzGmLvyV1TMsoFcQjRa8ZomyJ7KSjHILIC0mmMRmrbZ
	7B4QyaVnTnQqATUYeSQjJ37xVnLthUcNtYbMd1wsMLtj3e3QaJdyQPQSK0U/biUPMkPl07uiBtT9W
	M6sYfeBcdBsEc9nAdc3aCWi9MwNXF5IT/XEgDN6ooZZPUkZxuGwLXc8uO4q6WZcKNzpqcVzM44Mae
	z5Fpv1Ti0iha8U/7Q/PcchLEqLeukTOXfmPp3Xxsi8RvxRgku9rPj2w9YGBfdmae7MlJ8aXPAjY1b
	Vtu4b9B+Bc4FkxsWlZyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRvFs-00AFI4-Er; Sat, 27 Aug 2022 12:49:40 +0000
Received: from mout.kundenserver.de ([212.227.126.135])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRvFp-00AFFg-CG
	for linux-riscv@lists.infradead.org; Sat, 27 Aug 2022 12:49:38 +0000
Received: from mail-ej1-f42.google.com ([209.85.218.42]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MnJdE-1pBCAg1kCC-00jEuV for <linux-riscv@lists.infradead.org>; Sat, 27 Aug
 2022 14:49:30 +0200
Received: by mail-ej1-f42.google.com with SMTP id lx1so7565691ejb.12
        for <linux-riscv@lists.infradead.org>; Sat, 27 Aug 2022 05:49:29 -0700 (PDT)
X-Gm-Message-State: ACgBeo2UygMgiqLWzVwGsF87knhPwKIQzgp9AwrkLCr4+oeB8kcaim9G
	1cURis+kRdLP91To2c8+iZSSZjHo0w2XUFtvkTA=
X-Google-Smtp-Source: AA6agR4J9XTdGZjJb8R8xF2Baz3XbMezjaE/aWqaT70o2dkgXf9PwjIXOYEASc9MIhHdMWKvcgt5om3QPK6lTDMaEZo=
X-Received: by 2002:a17:906:8450:b0:741:5b1b:5c7f with SMTP id
 e16-20020a170906845000b007415b1b5c7fmr501641ejy.766.1661604569536; Sat, 27
 Aug 2022 05:49:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220815032025.2685516-1-tongtiangen@huawei.com>
 <20220815032025.2685516-2-tongtiangen@huawei.com> <CAK8P3a0ixaYimjCh77QBJpbHbVsw+9C7RiW2LEnwQ8HnwG_jHg@mail.gmail.com>
 <c0e286b4-3005-71fb-3bb2-476944099d4e@huawei.com>
In-Reply-To: <c0e286b4-3005-71fb-3bb2-476944099d4e@huawei.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sat, 27 Aug 2022 14:49:13 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0akgBkyVQuAfi5qdi9O5DhxZJ3FknxGH-gedpJpAVw6w@mail.gmail.com>
Message-ID: <CAK8P3a0akgBkyVQuAfi5qdi9O5DhxZJ3FknxGH-gedpJpAVw6w@mail.gmail.com>
Subject: Re: [PATCH -next v2 1/2] riscv: uaccess: rename __get/put_user_nocheck
 to __get/put_mem_nocheck
To: Tong Tiangen <tongtiangen@huawei.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor.Dooley@microchip.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	wangkefeng.wang@huawei.com, Guohanjun <guohanjun@huawei.com>
X-Provags-ID: V03:K1:8xvpnvvt6rQGr84m4i8IAjlTByGbvvrXmN9+EIl0DralECRc4x8
 oYRPp35IXBpy5tO42CAVLLp6Wy4cSl3THuZrimJL9JKQQeBunA7g28aoKrLxttbtuqe+V8q
 pMdeoejDKYRX+Ufub00Fw00q9/Q++Pjm0/WDbOqKVi/ZQ5aVpG1mTMvVME4MvU5Bn+/lua9
 tQulHD8/6SiRMwxGSbU4g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:GC65NXB0MTA=:YewsOUVIHtGgROdJBBlpTD
 Cy/ixGT65xKzHA3W/Etk+IiMBpZOaSjhJgUQtlgtT2pwMhMiR4zle1ctRwndapJ8VSWpRi199
 T5kX3smCqj611fpWx5cwBDpoRKJbmcnTYfcS7Wyld9QZnd+zH6M9HoBPZ8TB9CN7Hk4m0PodJ
 VSNfWWf59gqEqJj+ImaHNFmg6HqHHTivZ7nTj9OYqOlH58vVg3MyICNP2iJMepIHTAIc/Vfnl
 V4xLnmI4dr8SMRrSPXHFOfQK9zXaDguGLPzV1l5Mw1FoGEKT61UpU1VBe42fVL9BRVeJLX+W6
 U1sb2S/Exicdv9QUq0VZzQoQGAMSYRt3r0eO9a2+8tLfsqFcDvnb32E2w7qE/ASNmVIcqcuT0
 HQXTg4pChgVDmr+N8Yn4kOoXlz2OosXCiupxtlpj8wc00+k1nCfZaRBBhrhxWGZVoQIxOKE45
 3npcBXy+aUJ+HchWq7nW0In4uQtaTmHbQ1NdViC/uoJY3P3bfs0Y0d47wHOBZv/jcHJ8Lm0Rq
 EnJW+QVCFEw/8QIVr3MRXN6rTZUdCz9Jyb09JahRhgLFU6ozIh23HcpmfexmKyUlJ6jf4j6D6
 CeLgCrdjt5lEDqy+BVzw9TouhzhCfkC53bc2Cxdd5wJax6hQmhu5qfddQ/XP7qM5cv3vVxxjt
 pd+oM+LYx7Yjhx//rm4J8Tt0HU00eohPGd9isGxgPiOtyKg/YQXlojpsPGk2vsPgKt+fXEuvS
 d6bJV4oY0PSVaVyQUeGe9l6jeVXIp8gaGZwx2TDaOHGSVhtIK/yHnTr3r+7+CgexYzyVwKHXo
 1uWY0NaadXI348Kkp8umL+PC2fpEae9yAVc1gTXTRRKGaLgPSd3qWQX77ggimUY2DgA7nKw7v
 nP/kbPnVCUQCCQryNt0g==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220827_054937_735793_BA40DF52 
X-CRM114-Status: GOOD (  14.69  )
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

T24gU2F0LCBBdWcgMjcsIDIwMjIgYXQgMTI6NDMgUE0gVG9uZyBUaWFuZ2VuIDx0b25ndGlhbmdl
bkBodWF3ZWkuY29tPiB3cm90ZToKPiDlnKggMjAyMi84LzI2IDE3OjMwLCBBcm5kIEJlcmdtYW5u
IOWGmemBkzoKPgo+IEkgYW0gdmVyeSBpbnRlcmVzdGVkIGluIHRoZSBpbXBsZW1lbnRhdGlvbiBv
ZiBYODYuIEkgbmVlZCB0byBpbnZlc3RpZ2F0ZQo+IGFuZCBjb25zaWRlciBhIGNyb3NzIGFyY2hp
dGVjdHVyZSBpbXBsZW1lbnRhdGlvbi4KCk9uZSBtb3JlIHBvaW50IGFib3V0IHRoZSBjcm9zcy1h
cmNoaXRlY3R1cmUgd29yazogaXQgZ2VuZXJhbGx5IG1ha2VzCnNlbnNlIHRvIGRvIHRoZSBtb3N0
IGNvbW1vbmx5IHVzZWQgYXJjaGl0ZWN0dXJlcyBmaXJzdCwgdXN1YWxseQp0aGF0IHdvdWxkIGJl
IHg4NiwgYXJtNjQgYW5kIHBvd2VycGM2NCwgZm9sbG93ZWQgYnkgcmlzY3YsIGFybSwKczM5MCBh
bmQgbWlwcy4gSWYgd2UgY2FuIGZpbmQgc29tZXRoaW5nIHRoYXQgdGhlIGZpcnN0IGFyY2hpdGVj
dHVyZQptYWludGFpbmVycyBsaWtlLCBldmVyeW9uZSBlbHNlIGNhbiBmb2xsb3cgYW5kIHlvdSBk
b24ndCBoYXZlIHRvCnJld29yayBhbGwgb2YgdGhlbSBtdWx0aXBsZSB0aW1lcyBiZWZvcmUgZ2V0
dGluZyB0byBhIGNvbnNlbnN1cy4KCj4gSG93ZXZlciwgSSB1bmRlcnN0YW5kIHRoYXQgdGhlIG1v
ZGlmaWNhdGlvbiBvZiB0aGUgY3VycmVudCBwYXRjaCBoYXMKPiBsaXR0bGUgdG8gZG8gd2l0aCB0
aGUgdHdvIHBvaW50cyBtZW50aW9uZWQgYWJvdmUuIFdlIGNhbiBvcHRpbWl6ZSB0aGUKPiBjb2Rl
IHN0ZXAgYnkgc3RlcC4KCllvdSBhcmUgY29ycmVjdCB0aGF0IHRoaXMgaGFzIGxpdHRsZSB0byBk
byB3aXRoIHlvdXIgcGF0Y2gsIG15IHBvaW50CndhcyBtYWlubHkgdGhhdCB5b3VyIHBhdGNoIGlz
IG1vdmluZyB0aGUgY29kZSBmdXJ0aGVyIGF3YXkgZnJvbQp0aGUgb3RoZXIgYXJjaGl0ZWN0dXJl
cywgc28gaXQgd291bGQgbWFrZSBpdCBoYXJkZXIgdG8gdGhlbiBkbyB0aGUKY2hhbmdlcyB3ZSBh
Y3R1YWxseSB3YW50LgoKICAgICAgIEFybmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
