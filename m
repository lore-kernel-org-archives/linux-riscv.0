Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A999CFD2F6
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Nov 2025 04:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uMlhWsiFnEKjQeECrt8BMjACdYAXkNgngSjqyapG5jk=; b=kCgkmwtknpskrJ
	2v7lpgj1DA+87b0bO1noY1GIdqlNBDciOQwaw9HzAZ1StY1Pat4Jlk3jQAl9xPifp3OpgI4mdpFv9
	imrOtM0rrH+9xW+aZCHwP1RFQOrUhN4F4LInqaSboS2vKfspB4v+Ku+WP0xYW3z9pqUQDHmKJ28Te
	/OwUxV7tNUne9DFSM1PslCdqaTRaj+wpuMp9r5hIHd3Q29MqzOVtYBv2jSt6pPUG00RVdyBxzUphw
	6lYCiH5kTflOX5+/GilSt95UwsVid4W3T16omQaIcqDvV+hBe2IxoHauLDUzusDCN0eT17UEp9ooQ
	9h4OlWovy/ztUbuPaLnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOTWa-0000000FxjQ-1qBd;
	Thu, 27 Nov 2025 04:22:32 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOTWX-0000000Fxii-47HF
	for linux-riscv@lists.infradead.org;
	Thu, 27 Nov 2025 04:22:31 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-8b2148ca40eso56145185a.1
        for <linux-riscv@lists.infradead.org>; Wed, 26 Nov 2025 20:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764217349; x=1764822149; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WBY2hGlp5xDNa7Ek85Hj92aNDRHVnR99QGNyQtFdIz8=;
        b=Jd5G2Zo3AMby5ZpfnwoQgeiA9RQPeheBgY6IICcXNr8Q8hJfmduEzdm3LuoifgRizF
         4kSgRXu6Lbu+StX7gMlYLoW2i4U2wh/kD9ojrbDt8LHF2s0MNy8Z+nSCKgCCngAQJJeX
         bV7jkH3XIeKu7m+PAWLkI7EX7iAMWBbzj1K0gS4ot9TeqPz8kT75Bp3ZCCuGsOoVFI6O
         qE8EYbVvtRGn4cDf9a0ED2bwwFpomlgxK7R0KWyVqlDYBI88ERf0jor4PcBGJL4PviVR
         PIWwWwhuCcxKlE1sl/SuEJPPux1DBaZNGuH8stuJLUwC38C5w7uo3PGii0LQzKDCvqlG
         JgDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764217349; x=1764822149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WBY2hGlp5xDNa7Ek85Hj92aNDRHVnR99QGNyQtFdIz8=;
        b=FMERuquvv035iyUVioW92RGdl/Mi0UK6Si7MRGkz8dSbNIzE1/p0APJXodi5jQwIIE
         Pr+7o/i1Al6h/Sxr0jz1SZ88Hjfb69Iz3MZanyPFVKb2zIvpkrCrVkFvmqsLBCQt0FHF
         hM25M98esaj0wE8UZPQ6zhXLGIBxjx8YXhWex6u0JzB39CicvauyK6rAan3E4yggXx3w
         ZWUoJ+Uc29eVqxUbqNZkbrpK54dicNABLtAE9J+Uh+FZKQvCo+LVg53B0wpEeQ9Tmsgt
         C0qidlBEjHHpAOAwDP19xjtmqH4Pv4sKugUJQVGm1/vPZEUpGS39s8nvYvcJHOM63Wyo
         rPoA==
X-Forwarded-Encrypted: i=1; AJvYcCUOOp2hAoXCbf8ChqbxBBZGu/G+kPIeqLuq73seh443wOHKkC0MVoP3ZlH5Nk+PIc2yBZmTxCiRXiSPJQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyIGv98swRVzjnHXLI5b0NYj7KeFvkaWZx9OGeZ9bbJfYoe36gA
	2wQ2zRQGm0fd4ME5HUz6k/9b5BlcJ7QnHC4Gz0F7Krr6/TShnNcOWCiox/AstleMRGN/Fvllqrn
	7TMPPhtCkM0nekenjCrQH6ExrcuKYcsw=
X-Gm-Gg: ASbGncsh9oTPdC3xEoVoMo8+GhdWbgAXh+8xb4BJfvjyuNSJggJikVqHv7vnCs7XqxR
	JFdoat1r8xFoh5e0N/0eRzvv+O1OGWP+s/7Fic/9Mp3A7tEKTjx7PjjDhqfLVKP75iBIDwWTB+s
	QdUN2jnf3QryTappbE35+4ide0qCLoAQB1xk2JnuDvFn/ilUtaqrJVC+OLi+yZXUcWyC1BLnbTF
	yzOF6jHGeFPCIRN19ucRaCzzB2AQ5dijwuafiWo1qKmDM8Vd/BoRHE2HdoDpZsh9yPsDTarGdHx
	9lQn
X-Google-Smtp-Source: AGHT+IF/2OHEG3LUgPMXOJw4DDaFf/N1kDbkxj4PlQ+jOCs1AfpUOxHzVBEY8oHxETzeiPPKmtGSMi/k9qIz1abldeY=
X-Received: by 2002:a05:620a:44d4:b0:8b2:f9ac:a893 with SMTP id
 af79cd13be357-8b33d49a4c6mr3106281485a.66.1764217348492; Wed, 26 Nov 2025
 20:22:28 -0800 (PST)
MIME-Version: 1.0
References: <20251127011438.6918-1-21cnbao@gmail.com> <aSfO7fA-04SBtTug@casper.infradead.org>
In-Reply-To: <aSfO7fA-04SBtTug@casper.infradead.org>
From: Barry Song <21cnbao@gmail.com>
Date: Thu, 27 Nov 2025 12:22:16 +0800
X-Gm-Features: AWmQ_bnJyCR-GwS1_fTaB2mJ8nbB2MiVvoC0dBi_6l0nwDIR-Nl2i2LJsMX4LWo
Message-ID: <CAGsJ_4zyZeLtxVe56OSYQx0OcjETw2ru1FjZjBOnTszMe_MW2g@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] mm: continue using per-VMA lock when retrying
 page faults after I/O
To: Matthew Wilcox <willy@infradead.org>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, 
	Barry Song <v-songbaohua@oppo.com>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Pedro Falcato <pfalcato@suse.de>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Oscar Salvador <osalvador@suse.de>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Oven Liyang <liyangouwen1@oppo.com>, Mark Rutland <mark.rutland@arm.com>, 
	Ada Couprie Diaz <ada.coupriediaz@arm.com>, Robin Murphy <robin.murphy@arm.com>, 
	=?UTF-8?Q?Kristina_Mart=C5=A1enko?= <kristina.martsenko@arm.com>, 
	Kevin Brodsky <kevin.brodsky@arm.com>, Yeoreum Yun <yeoreum.yun@arm.com>, 
	Wentao Guan <guanwentao@uniontech.com>, Thorsten Blum <thorsten.blum@linux.dev>, 
	Steven Rostedt <rostedt@goodmis.org>, Yunhui Cui <cuiyunhui@bytedance.com>, 
	Nam Cao <namcao@linutronix.de>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-fsdevel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_202230_036308_35CF3BB6 
X-CRM114-Status: GOOD (  19.58  )
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

T24gVGh1LCBOb3YgMjcsIDIwMjUgYXQgMTI6MDnigK9QTSBNYXR0aGV3IFdpbGNveCA8d2lsbHlA
aW5mcmFkZWFkLm9yZz4gd3JvdGU6Cj4KPiBPbiBUaHUsIE5vdiAyNywgMjAyNSBhdCAwOToxNDoz
NkFNICswODAwLCBCYXJyeSBTb25nIHdyb3RlOgo+ID4gVGhlcmUgaXMgbm8gbmVlZCB0byBhbHdh
eXMgZmFsbCBiYWNrIHRvIG1tYXBfbG9jayBpZiB0aGUgcGVyLVZNQQo+ID4gbG9jayB3YXMgcmVs
ZWFzZWQgb25seSB0byB3YWl0IGZvciBwYWdlY2FjaGUgb3Igc3dhcGNhY2hlIHRvCj4gPiBiZWNv
bWUgcmVhZHkuCj4KPiBTb21ldGhpbmcgSSd2ZSBiZWVuIHdvbmRlcmluZyBhYm91dCBpcyByZW1v
dmluZyBhbGwgdGhlICJkcm9wIHRoZSBNTQo+IGxvY2tzIHdoaWxlIHdlIHdhaXQgZm9yIEkvTyIg
Z3Vuay4gIEl0J3MgYSBuaWNlIGFtb3VudCBvZiBjb2RlIHJlbW92ZWQ6CgpJIHRoaW5rIHRoZSBw
b2ludCBpcyB0aGF0IHBhZ2UgZmF1bHQgaGFuZGxlcnMgc2hvdWxkIGF2b2lkIGhvbGRpbmcgdGhl
IFZNQQpsb2NrIG9yIG1tYXBfbG9jayBmb3IgdG9vIGxvbmcgd2hpbGUgd2FpdGluZyBmb3IgSS9P
LiBPdGhlcndpc2UsIHRob3NlCndyaXRlcnMgYW5kIHJlYWRlcnMgd2lsbCBiZSBzdHVjayBmb3Ig
YSB3aGlsZS4KCj4KPiAgaW5jbHVkZS9saW51eC9wYWdlbWFwLmggfCAgOCArLS0tCj4gIG1tL2Zp
bGVtYXAuYyAgICAgICAgICAgIHwgOTggKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQo+ICBtbS9pbnRlcm5hbC5oICAgICAgICAgICB8IDIxIC0tLS0tLS0t
LS0tCj4gIG1tL21lbW9yeS5jICAgICAgICAgICAgIHwgMTMgKy0tLS0tLQo+ICBtbS9zaG1lbS5j
ICAgICAgICAgICAgICB8ICA2IC0tLQo+ICA1IGZpbGVzIGNoYW5nZWQsIDI3IGluc2VydGlvbnMo
KyksIDExOSBkZWxldGlvbnMoLSkKPgo+IGFuZCBJJ20gbm90IHN1cmUgd2Ugc3RpbGwgbmVlZCB0
byBkbyBpdCB3aXRoIHBlci1WTUEgbG9ja3MuICBXaGF0IEkKPiBoYXZlIGhlcmUgZG9lc24ndCBi
b290IGFuZCBJIHJhbiBvdXQgb2YgdGltZSB0byBkZWJ1ZyBpdC4KCkkgYWdyZWUgdGhlcmXigJlz
IHJvb20gZm9yIGltcHJvdmVtZW50LCBidXQgbWVyZWx5IHJlbW92aW5nIHRoZSAiZHJvcCB0aGUg
TU0KbG9ja3Mgd2hpbGUgd2FpdGluZyBmb3IgSS9PIiBjb2RlIGlzIHVubGlrZWx5IHRvIGltcHJv
dmUgcGVyZm9ybWFuY2UuCgpGb3IgZXhhbXBsZSwgd2UgY291bGQgY2hhbmdlIHRoZSBmbG93IHRv
OgoxLiBSZWxlYXNlIHRoZSBWTUEgbG9jayBvciBtbWFwX2xvY2sKMi4gTG9jayB0aGUgZm9saW8K
My4gUmUtYWNxdWlyZSB0aGUgVk1BIGxvY2sgb3IgbW1hcF9sb2NrCjQuIFJlLWNoZWNrIHdoZXRo
ZXIgd2UgY2FuIHN0aWxsIG1hcCB0aGUgUFRFCjUuIE1hcCB0aGUgUFRFCgpDdXJyZW50bHksIHRo
ZSBmbG93IGlzIGFsd2F5czoKCjEuIFJlbGVhc2UgdGhlIFZNQSBsb2NrIG9yIG1tYXBfbG9jawoy
LiBMb2NrIHRoZSBmb2xpbwozLiBVbmxvY2sgdGhlIGZvbGlvCjQuIFJlLWVudGVyIHRoZSBwYWdl
IGZhdWx0IGhhbmRsaW5nIGZyb20gdGhlIGJlZ2lubmluZwoKVGhlIGNoYW5nZSB3b3VsZCBiZSBt
dWNoIG1vcmUgY29tcGxleCwgc28gSeKAmWQgcHJlZmVyIHRvIGxhbmQgdGhlIGN1cnJlbnQKcGF0
Y2hzZXQgZmlyc3QuIEF0IGxlYXN0IHRoaXMgd2F5LCB3ZSBhdm9pZCBmYWxsaW5nIGJhY2sgdG8g
bW1hcF9sb2NrIGFuZApjYXVzaW5nIGNvbnRlbnRpb24gb3IgcHJpb3JpdHkgaW52ZXJzaW9uLCB3
aXRoIG1pbmltYWwgY2hhbmdlcy4KClRoYW5rcwpCYXJyeQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
