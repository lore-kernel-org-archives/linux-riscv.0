Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4080AC433F5
	for <linux-riscv@archiver.kernel.org>; Thu,  5 May 2022 11:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HNaHPvHYsRP31qyc1bAW1VfdXPLDZADXfkmLl4+dDes=; b=k/I8jIg9cRfe+T
	Ar9X4hW95RIKpc2be7oybNqiwD67GxDweMJmHBtIVLRWWsomRm6HEKU5/TJ6rbA+m6qC7/SfrevHO
	3/bMoPoSPkUdFucYNH5QtHPw8UIXXzryRKs2ChiK/3MUnmooz3AOEce+TzXaH3ljK+NbFp4lzBUX6
	K6oaJRwgMICl5+G2XbUBi9GMd3bEHC/JiG4sqMx1JyuqZg3vNbdM+wFwt4G6QYKdSuO7fDQ9heei2
	o8FlDTbu3d1qvaSK5cBk01LFACrPAA6swpH9tenfxrc3VTlfy8+SKHPIhmcL7AvMxsTs3MAw74E3o
	Fn62CIPYTAqCX2T3kQew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmZIf-00FNa4-Ng; Thu, 05 May 2022 11:05:37 +0000
Received: from mout.kundenserver.de ([212.227.126.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmZIZ-00FNXl-Jz
 for linux-riscv@lists.infradead.org; Thu, 05 May 2022 11:05:36 +0000
Received: from mail-wr1-f42.google.com ([209.85.221.42]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MYehP-1nGzdr3ab5-00VeAY for <linux-riscv@lists.infradead.org>; Thu, 05 May
 2022 13:05:28 +0200
Received: by mail-wr1-f42.google.com with SMTP id k2so5609396wrd.5
 for <linux-riscv@lists.infradead.org>; Thu, 05 May 2022 04:05:28 -0700 (PDT)
X-Gm-Message-State: AOAM5301R5rwlRjlXfuCOy3xmcVJGGgmYzGzXj4aqH2vfwxTE8v+mGTF
 GOR1gmS3YcLM+Yhu5V3rtkzTssV2zqwSEytYB6A=
X-Google-Smtp-Source: ABdhPJxGGq5Fa9Cx5SSfnKSUo4b+MfSDkdVAVLGUTqD/GBtgFGV3C400pAFOppOt2I8pMGzWGNhT2WNvFkyhjBMEOv4=
X-Received: by 2002:a5d:49cb:0:b0:20a:cee3:54fc with SMTP id
 t11-20020a5d49cb000000b0020acee354fcmr19580488wrs.12.1651748727768; Thu, 05
 May 2022 04:05:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220430153626.30660-1-palmer@rivosinc.com>
 <20220430153626.30660-3-palmer@rivosinc.com>
 <7375410.EvYhyI6sBW@diego>
In-Reply-To: <7375410.EvYhyI6sBW@diego>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 5 May 2022 13:05:11 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2fLg9DJvQeOAFhRQk-O72PAhJ77CLQ+Pz_Vvh1WV1APQ@mail.gmail.com>
Message-ID: <CAK8P3a2fLg9DJvQeOAFhRQk-O72PAhJ77CLQ+Pz_Vvh1WV1APQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] asm-generic: qspinlock: Indicate the use of
 mixed-size atomics
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Arnd Bergmann <arnd@arndb.de>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Guo Ren <guoren@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, 
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>,
 Boqun Feng <boqun.feng@gmail.com>, Jonas Bonn <jonas@southpole.se>, 
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Greg KH <gregkh@linuxfoundation.org>, 
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>, 
 Jisheng Zhang <jszhang@kernel.org>, linux-csky@vger.kernel.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Openrisc <openrisc@lists.librecores.org>, 
 linux-arch <linux-arch@vger.kernel.org>, Palmer Dabbelt <palmer@rivosinc.com>
X-Provags-ID: V03:K1:DmnPekOUdbqg+/9Grcqtb3fdQXiWapWZz7bNnkEzn4rPib0QJs9
 L6gPDv9hnooO9Ej7tTW2gNql/i6iFG3KP30ujKrXodSsGU9vUvMzzJzCGPz2eXbTTWRPJYn
 GWLAWwGw43OfhRh7/kzHYUhRR8gEFGqGHw0N9ph2KW2vgApL54EOb9rbwYO03lRivqbrrZZ
 GDg8sE3k3psNsD+5LwbWw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:IJjHe8esp0M=:RaEZBXLA4q8oa7XwRoGnYk
 6Etjy4z+gKY6ddYq4/5Yg9UDvDSYtOyDO1PUMKrAk1s0QORwpVGiin2f2e/sIzh8gXHpnN+hq
 i+u2QDPYsnOZs2NfL9WDKx2B6y2S6BXFvZ6vu3AxOdsxGpE4aBXQVfK0mG4dUV3Kj1ZRlE4Vs
 9F4hqqZ/F/ccEGxEmT81QwvnEyBmgflqXVCTajYFJ+Wk+0d6YaW1knyqLNNOclZQNN/k+9IxB
 857hRg8Hf/R1+z1IMe1qenzrH4gi/157+YpHpKmPROYdYuK1RnGFlWNtm1bce9S3FJs+NTewY
 xUww6y9b0Yjtxx8Y4zvm7Xcf1Cf6csQSNBUJ8EJudnCg2XwnMVKzw2cO2uMOFaApWn1RzCQ1/
 kKVXoZedLnLaDPsP5PKsbAkpEyEzY0dgTYyRtzFOMZjuVTaG9J/+Gg4snlw1fxQQjwdUfe40h
 gemIH4mpjPeJUmdsHyepA63mb5gs6/8rZ8uh9pW2/lkM1P9z35LYQ+6wFCCCnbgaSg3olIU+Y
 iEWohHT4FQ76whPu2qvYj5CvMQSVxNKsAjfPMkn44FOZluP4LVpw5cHA28d3ap5SIzGrI9siD
 HLC5w4gVszwZBsfGlfazXU3M6KhXv4HkA1WKxBIYfgWBS0w1X6Jsv8uIGNZXHVunaD7HQUZLc
 pqL6Ojy/4wWw+tJmbnGuvK2rTkgj44feboJvtlbaTEWPjcH3avj6O3GQtp62VOG2hZGupVhyc
 201oQyg46EkQtd5pqqvUURqgFDLAEZOo2dph5Xe+yG5l4AnQ1h3hz/e97oI41z23xQux834rE
 o+y83zPuV2M2O0fbu6JeHfW4WdX3g2J+0FA6sQC0uCc5Wfhg7o=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_040532_015411_6CE3F962 
X-CRM114-Status: GOOD (  13.96  )
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

T24gV2VkLCBNYXkgNCwgMjAyMiBhdCAyOjAyIFBNIEhlaWtvIFN0w7xibmVyIDxoZWlrb0BzbnRl
Y2guZGU+IHdyb3RlOgo+ID4gaW5kZXggZDc0YjEzODI1NTAxLi45NWJlM2YzYzI4YjUgMTAwNjQ0
Cj4gPiAtLS0gYS9pbmNsdWRlL2FzbS1nZW5lcmljL3FzcGlubG9jay5oCj4gPiArKysgYi9pbmNs
dWRlL2FzbS1nZW5lcmljL3FzcGlubG9jay5oCj4gPiBAQCAtMiw2ICsyLDM3IEBACj4gPiAgLyoK
PiA+ICAgKiBRdWV1ZWQgc3BpbmxvY2sKPiA+ICAgKgo+ID4gKyAqIEEgJ2dlbmVyaWMnIHNwaW5s
b2NrIGltcGxlbWVudGF0aW9uIHRoYXQgaXMgYmFzZWQgb24gTUNTIGxvY2tzLiBBbgo+Cj4gX0Zv
cl8gYW4gYXJjaGl0ZWN0dXJlIHRoYXQncyAuLi4gPwo+Cj4gPiArICogYXJjaGl0ZWN0dXJlIHRo
YXQncyBsb29raW5nIGZvciBhICdnZW5lcmljJyBzcGlubG9jaywgcGxlYXNlIGZpcnN0IGNvbnNp
ZGVyCj4gPiArICogdGlja2V0LWxvY2suaCBhbmQgb25seSBjb21lIGxvb2tpbmcgaGVyZSB3aGVu
IHlvdSd2ZSBjb25zaWRlcmVkIGFsbCB0aGUKPiA+ICsgKiBjb25zdHJhaW50cyBiZWxvdyBhbmQg
Y2FuIHNob3cgeW91ciBoYXJkd2FyZSBkb2VzIGFjdHVhbGx5IHBlcmZvcm0gYmV0dGVyCj4gPiAr
ICogd2l0aCBxc3BpbmxvY2suCj4gPiArICoKPiA+ICsgKgo+Cj4gZG91YmxlIGVtcHR5IGxpbmUg
aXMgcHJvYmFibHkgbm90IG5lY2Vzc2FyeQo+CgpJJ3ZlIGFwcGxpZWQgdGhlIHNlcmllcyB0byB0
aGUgYXNtLWdlbmVyaWMgdHJlZSBub3csIGFuZCBlZGl0ZWQgYm90aCB0aGUgYWJvdmUKYXMgeW91
IHN1Z2dlc3RlZCBpbiB0aGUgcHJvY2VzcywgdG8gc2F2ZSBQYWxtZXIgdGhlIHY1LgoKICAgICAg
ICAgQXJuZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
