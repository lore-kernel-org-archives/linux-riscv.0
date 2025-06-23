Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BCFAC77B7C
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jun 2025 18:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e2SovlxJzyQ5xuB/OS1MyQm2xODBWXCmMpSFiqPO9AM=; b=Fl70tb7o+D1VQW
	Pyejc+7mRlEqveowa7Kn8K++aZtjwWiPwUM9vzKno4LTqDovm7JyjeEA/XDx57IXufgmqW98q0G2f
	KIUUppoGdrGN1uGMp8/bSdX3b8EFufCpLEPdi4bhhWZI+znBN/8TRf5SfdaFFipmEPX4OvVKweaGO
	q9SX/vX0p5cT35e3gd72IkjArr6Zx8oowUO8SSBCFADaPY7o3qqK+XmUhRJtT+gJka+8jlH4ze3A8
	hA5IVp1t5JirsF/gW1Dx2qNN1sAf2FFuvgSKrBx5zi0bSw3LLohHPsTL18zx7kLtQXnryfANeCCZv
	I/gI2IggfQofzXIhLQjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTlVC-00000003dRr-3lUk;
	Mon, 23 Jun 2025 18:02:42 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTiEM-0000000341B-1ZaP
	for linux-riscv@lists.infradead.org;
	Mon, 23 Jun 2025 14:33:07 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-553d52cb80dso4494335e87.1
        for <linux-riscv@lists.infradead.org>; Mon, 23 Jun 2025 07:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750689185; x=1751293985; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f9kmviqp5IY6ttItDCr2Op9/HvBDwWl4i3kTfEm4FXc=;
        b=0IwVg6HZzw8PnvKw7vyp9aIzQ0/ybzMfTDl7f9V8qXWiVL3ffyBD1etlCBdQRuPaeF
         k7RBDrrt7+OpQmWzHBk/PwmODpdlSeJW8BQgU/qvHMgpWCA1MBasIlR8Jh9pBrTU2PUV
         gFAzIisy/nczvUmF3aAk3+eT6f4c3Q2KyzmnTbdKq3J8/+vqDAfH67lQMAoB48zTqR0k
         hLguae7VwUhjRD9264A8yZ2GxnjlgRsCOlSlUCxxKAaaNYIOBPreablhmpXf/GqcoKmo
         2zXH612DmDnepGdz991oIiDnMj6q2OBr+OFAi87uKoyE6q1H4QgC+wfrcOOxw+gRgYZE
         xDFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750689185; x=1751293985;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f9kmviqp5IY6ttItDCr2Op9/HvBDwWl4i3kTfEm4FXc=;
        b=QCRIlH2jvNCZ1971Gzpmrx7kMMUclVI1lZEdScHz6nMIHSzl22SXa/fAKdMB3c429a
         IVTBykrkpjjPmn/ISF8PleWyVMyl+VVLVRt164LSMBzeK+BuMGd9i6t/XMn8mwRP9HM+
         p5Y+mMPRlqF2UE4GbKt5++IkGxezzJCnB418Q8YmY9RMQRhWw/tzssnIz0ymy+RkyzQk
         FSBcazTeP7vlDIttUVZc0E1uM9i/53/Ev9Na8+1HTGHBVBaB62Q5+G8g2hKzGkWfYo1O
         lREmHVidZxQNS2oZzjIVLIN0S3dJ+QLdXhR98/XarDP4q3f1XbtFNJFKqwwvqxx15mW8
         oXEg==
X-Forwarded-Encrypted: i=1; AJvYcCW7DcTmIz17SW5yL8b0CUmzBI3apa0qYgPnGLm56ym7iqMGYKPsCIdW4VQSivAwpSVbfdSClEDOwko6wQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwUtE/STvRgTaerrfZ8r68BSJuYSA82fg2vzrtk6YEsqYn6tkHf
	l7RZisjCM6D5VWpLEkGtrYZC6NCabu+18gSGcAadQhRNKnMvION+3nDh82k0A4p9QWRrjGA1z71
	Dc0JK0kE9AEVspVrWs3bz2STPpjlvNyICYQFRefc6zg==
X-Gm-Gg: ASbGncvIaoXTPNX9O0LCaX0yTIdUgwfrUG7KQ1F43cz4bSTWw+WvlTXJpEttQHIJx+W
	TQZPhG1/ir7SRa8lpvisIXHIpT5UyMQ5NeRitce2DoHGNoSd9vA831WYSmafsfMFw9LKK2UCwF2
	obaI2mc6CRUDVQ6WR2QBonxEC17PGZ2xF0eH+plu9/eXAzJbEY7pE5M5WrsgnIX+v4bJC+Ogbfj
	w==
X-Google-Smtp-Source: AGHT+IHy7lPbB51UgKZbeAiEHWJjzs4pV8mJk0NbuirPhDOStHcXQ3Z+f7X+tD5fIjGZbRD5DTCBFLexuzsXjZ0eBBQ=
X-Received: by 2002:a05:6512:3b25:b0:549:8ff1:e0f3 with SMTP id
 2adb3069b0e04-553e4fdf72dmr3670967e87.5.1750689183720; Mon, 23 Jun 2025
 07:33:03 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250623114430eucas1p2a5bb2bbc0049186ff25e1b3e1a131ca2@eucas1p2.samsung.com>
 <20250623-apr_14_for_sending-v6-0-6583ce0f6c25@samsung.com> <20250623-apr_14_for_sending-v6-1-6583ce0f6c25@samsung.com>
In-Reply-To: <20250623-apr_14_for_sending-v6-1-6583ce0f6c25@samsung.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 23 Jun 2025 16:32:52 +0200
X-Gm-Features: AX0GCFtTbdiml00OQLqQ03QSeuySTknlMk23hbdQ1cT1QnS7KP2eYmI1IjWfLlA
Message-ID: <CAMRc=MfPLZ7oMVjLv+_GMoC8X+O=k+mMrQKxELho0=+Z7=HApQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/8] power: sequencing: Add T-HEAD TH1520 GPU power
 sequencer driver
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Frank Binns <frank.binns@imgtec.com>, 
	Matt Coster <matt.coster@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_073306_500727_E95C9E13 
X-CRM114-Status: GOOD (  17.50  )
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

T24gTW9uLCBKdW4gMjMsIDIwMjUgYXQgMTo0NOKAr1BNIE1pY2hhbCBXaWxjenluc2tpCjxtLndp
bGN6eW5za2lAc2Ftc3VuZy5jb20+IHdyb3RlOgo+Cj4gSW50cm9kdWNlIHRoZSBwd3JzZXEtdGhl
YWQtZ3B1IGRyaXZlciwgYSBwb3dlciBzZXF1ZW5jZXIgcHJvdmlkZXIgZm9yCj4gdGhlIEltYWdp
bmF0aW9uIEJYTS00LTY0IEdQVSBvbiB0aGUgVC1IRUFEIFRIMTUyMCBTb0MuIFRoaXMgZHJpdmVy
Cj4gY29udHJvbHMgYW4gYXV4aWxpYXJ5IGRldmljZSBpbnN0YW50aWF0ZWQgYnkgdGhlIEFPTiBw
b3dlciBkb21haW4uCj4KPiBUaGUgVEgxNTIwIEdQVSByZXF1aXJlcyBhIHNwZWNpZmljIHNlcXVl
bmNlIHRvIGNvcnJlY3RseSBpbml0aWFsaXplIGFuZAo+IHBvd2VyIGRvd24gaXRzIHJlc291cmNl
czoKPiAgLSBFbmFibGUgR1BVIGNsb2NrcyAoY29yZSBhbmQgc3lzKS4KPiAgLSBEZS1hc3NlcnQg
dGhlIEdQVSBjbG9jayBnZW5lcmF0b3IgcmVzZXQgKGNsa2dlbl9yZXNldCkuCj4gIC0gSW50cm9k
dWNlIGEgc2hvcnQgaGFyZHdhcmUtcmVxdWlyZWQgZGVsYXkuCj4gIC0gRGUtYXNzZXJ0IHRoZSBH
UFUgY29yZSByZXNldC4gVGhlIHBvd2VyLWRvd24gc2VxdWVuY2UgcGVyZm9ybXMgdGhlc2UKPiAg
ICBzdGVwcyBpbiByZXZlcnNlLgo+Cj4gSW1wbGVtZW50IHRoaXMgc2VxdWVuY2UgdmlhIHRoZSBw
d3JzZXFfcG93ZXJfb24gYW5kIHB3cnNlcV9wb3dlcl9vZmYKPiBjYWxsYmFja3MuCj4KPiBDcnVj
aWFsbHksIHRoZSBkcml2ZXIncyBtYXRjaCBmdW5jdGlvbiBpcyBjYWxsZWQgd2hlbiBhIGNvbnN1
bWVyICh0aGUKPiBJbWFnaW5hdGlvbiBHUFUgZHJpdmVyKSByZXF1ZXN0cyB0aGUgImdwdS1wb3dl
ciIgdGFyZ2V0LiBEdXJpbmcgdGhpcwo+IG1hdGNoLCB0aGUgc2VxdWVuY2VyIHVzZXMgY2xrX2J1
bGtfZ2V0KCkgYW5kCj4gcmVzZXRfY29udHJvbF9nZXRfZXhjbHVzaXZlKCkgb24gdGhlIGNvbnN1
bWVyJ3MgZGV2aWNlIHRvIG9idGFpbiBoYW5kbGVzCj4gdG8gdGhlIEdQVSdzICJjb3JlIiBhbmQg
InN5cyIgY2xvY2tzLCBhbmQgdGhlIEdQVSBjb3JlIHJlc2V0LiAgVGhlc2UsCj4gYWxvbmcgd2l0
aCBjbGtnZW5fcmVzZXQgb2J0YWluZWQgZnJvbSBwYXJlbnQgYW9uIG5vZGUsIGFsbG93IGl0IHRv
Cj4gcGVyZm9ybSB0aGUgY29tcGxldGUgc2VxdWVuY2UuCj4KPiBSZXZpZXdlZC1ieTogVWxmIEhh
bnNzb24gPHVsZi5oYW5zc29uQGxpbmFyby5vcmc+Cj4gU2lnbmVkLW9mZi1ieTogTWljaGFsIFdp
bGN6eW5za2kgPG0ud2lsY3p5bnNraUBzYW1zdW5nLmNvbT4KPiAtLS0KCltzbmlwXQoKPiArCj4g
KyAgICAgICAvKiBBZGRpdGlvbmFsbHkgdmVyaWZ5IGNvbnN1bWVyIGRldmljZSBoYXMgQU9OIGFz
IHBvd2VyLWRvbWFpbiAqLwo+ICsgICAgICAgaWYgKHB3cl9zcGVjLm5wICE9IGN0eC0+YW9uX25v
ZGUgfHwgcHdyX3NwZWMuYXJnc1swXSAhPSBUSDE1MjBfR1BVX1BEKSB7Cj4gKyAgICAgICAgICAg
ICAgIG9mX25vZGVfcHV0KHB3cl9zcGVjLm5wKTsKPiArICAgICAgICAgICAgICAgcmV0dXJuIDA7
Cj4gKyAgICAgICB9Cj4gKwo+ICsgICAgICAgb2Zfbm9kZV9wdXQocHdyX3NwZWMubnApOwo+ICsK
PiArICAgICAgIC8qIElmIGEgY29uc3VtZXIgaXMgYWxyZWFkeSBib3VuZCwgb25seSBhbGxvdyBh
IHJlLW1hdGNoIGZyb20gaXQgKi8KPiArICAgICAgIGlmIChjdHgtPmNvbnN1bWVyX25vZGUpCj4g
KyAgICAgICAgICAgICAgIHJldHVybiBjdHgtPmNvbnN1bWVyX25vZGUgPT0gZGV2LT5vZl9ub2Rl
Owo+ICsKClRoYXQgc2hvdWxkIGJlIGAhIShjdHgtPmNvbnN1bWVyX25vZGUgPT0gZGV2LT5vZl9u
b2RlKWAgb3IgcHJlZmVyYWJseQpgY3R4LT5jb25zdW1lcl9ub2RlID09IGRldi0+b2Zfbm9kZSA/
IDEgOiAwYC4gSSBjYW4gYW1lbmQgaXQgd2hlbgphcHBseWluZyBpZiB5b3UgaGF2ZSBubyBvYmpl
Y3Rpb25zLiBUaGUgcmVzdCBsb29rcyBnb29kIHRvIG1lIGFuZCBJJ2QKbGlrZSB0byBwaWNrIGl0
IHVwIGludG8gcHdyc2VxL2Zvci1uZXh0IGluIHRoZSBuZXh0IHR3byBkYXlzLgoKQmFydAoKW3Nu
aXBdCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
