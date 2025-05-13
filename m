Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C75E6C3ABC3
	for <linux-riscv@archiver.kernel.org>; Tue, 13 May 2025 21:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KZXrg4NgXtKzVMJzVe7AO7R4HYHhgdHGOnbH9tlml8s=; b=tQuk6GwUcqtuM3
	Mti6rH+9jMUtvbVQHHuMavwIqfqT/ljD3zl7mihtLZesxdZjVHjUtlDEcT6LS+XsCdIungTpFWZHo
	yGDoQb98l1D1/RZwPqX0mIf91mgtTOrzZfc3ExgOMpIBWp5WnguiRhNRgdf2V25/wAiLrJiETtFdN
	6mS9r8et5RkhH6yaIxzVWo6Q2P37FUPr9fMEZyv32QDPO9zA8uuZhIqYbbAQ0Tm1Xz4dJ57pzXshh
	My03zfmfLn5/pEXFivM2/HLs73g+g7L/Hf5dPKZ656rDqx/aShniOJFePcwSuy12lq+Q0I9/AQU0f
	PM1otWxel7nA/Pv0s8uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEx8S-0000000DYuF-2Z5B;
	Tue, 13 May 2025 21:26:00 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEx8P-0000000DYto-2j9G
	for linux-riscv@lists.infradead.org;
	Tue, 13 May 2025 21:25:59 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-22e3b069f23so57271825ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 13 May 2025 14:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747171556; x=1747776356; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R3RlUrB9vsvdRLDB/WErlx/ApSJjbQf0jOu6HOFeS/w=;
        b=LaWsxrjQt8lnF/Rku0pnGnCqZfUfHmrVPPYOYtuWAMJq8vklXzbTigQX9jtPGzqCq6
         jZqiEt0zv+eNocgapmkZzRfbIY/YBP72l/oVbqzwKk2o8m20KgocIdY+ZdvZEHkkxto7
         QW7DD8aK4ZYYKEEj8Tw7zumikqiD5054wl2RjNl2pqCUa6jS86PJi39NuxaDGLM2A7uR
         Gk9xLBri57AmrB6lFRraB0Z8OMfvAKA2OS2D5tAVRBC/s4LoGLLJCOgn6wXbHm1Za0cf
         cKiBV2PIrkjnwfo03Wqs+/qib9/5Yg77i3JaRhp1XOpjAYOsfRVF3ikUqVNZ/QWIJREA
         V9iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747171556; x=1747776356;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R3RlUrB9vsvdRLDB/WErlx/ApSJjbQf0jOu6HOFeS/w=;
        b=oyCg1te24oHwDDshu7WApAEDurqsFxBjg1ZXM338pll3CkaxxtWeVHMjiX0DV7u7Fb
         2moT6rCOLvJnnb8IQ5HueBLEY3X3/ffb7gERpEc7xQoI4IghBLIUrF6uTfdJwOCb3sq7
         QPmRPHGpW8QxTVjvJd5nfwvNIeXutf0HRy8MOF+UO14K4DxdDFC+jztw9PP1T0DhXg/t
         I5AeQilkhs1q9eGyddHzwV7rilYCnVoMA5BkehyUiEVN6f+qxri75gNnseUlwO8xFcsJ
         Yxs4xsHZANtcAfyy9cK+4h1H4K3Z8Zma2f58VHA+tn+Y6SH6pMO7a9ygrFARqsJN6zin
         8R8Q==
X-Forwarded-Encrypted: i=1; AJvYcCX1XPZaw9fL/g4nFbM3luxVfkyDE7EafJo6bCeaZNF62elfzzyELhbVBiNLTyPibWvU0fWwRQI+jrEojQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0NhjgRxRQtfJ2ftPxMqDMaz2WGCCt0lhNPw9b/EEVnYM86De7
	wl2wdNxONQ+CkqHSPeZrDyr3PzbmuIVWxKkLE/GheQbgbnrG4J7NqkMdNEUEcEo=
X-Gm-Gg: ASbGncsLkbeYneVLioGDcWe4nV4Cc048mEMRN47e7xCnK2j8fzu+oOthGoixPqcNEy+
	mZcM0X+B6PQ6mqWv5WoTDoO4UFIIxi785PtyYRujIi8TCSeZa+hEbTV4VkLhXfcNbeeGgS0B/0f
	dA4YtaRRIZi+Ojw3CqXfoNSxstpmYbM1bd+RM1LROJQYxIDiKbo4POuRtWh792vmkqVfyDiqBf3
	orlQ9uX4BYzYIY6KFbYKhqLyCpCNuu/QarDrk0yP+82hpTxOGOzqtqlNBNoqNBaDO8g/NODi5jk
	//o7HgmMbjd9NEqsNi+mKiRCh75VbjK/b8XqDF7G3Q==
X-Google-Smtp-Source: AGHT+IFocb82Pc+xAg+z3CR+mX8T9Fb3IZ3K1KpdH6BlWRo7TmjZ95U0igx6DKwvn349WA6Uo5EwQA==
X-Received: by 2002:a17:903:2f8d:b0:224:1ce1:a3f4 with SMTP id d9443c01a7336-23198116712mr13397695ad.1.1747171556281;
        Tue, 13 May 2025 14:25:56 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc82a1965sm85249085ad.231.2025.05.13.14.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 14:25:55 -0700 (PDT)
Date: Tue, 13 May 2025 14:25:53 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: Han Gao <rabenda.cn@gmail.com>, devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] riscv: dts: sophgo: Add xtheadvector to the sg2042
 devicetree
Message-ID: <aCO44SAoS2kIP61r@ghost>
References: <cover.1746828006.git.rabenda.cn@gmail.com>
 <af839bc200637e4eae1cb327c95ac98c82bccd52.1746828006.git.rabenda.cn@gmail.com>
 <MA0P287MB22624E52A6647B43D53DCD2CFE96A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
 <CAAT7Ki9zCYZ7u+nmQgSkgWgv+QSVb=miLRtcNQRfJFcd8JgcJg@mail.gmail.com>
 <MA0P287MB2262FF6EFEC6D01796683DE6FE96A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
 <CAAT7Ki-vamEx2f+nTJbd=WeB815ZheJV=mm7ohzBoZrsoaQV+g@mail.gmail.com>
 <MA0P287MB22629B5A1F6238FBBF9E3609FE96A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MA0P287MB22629B5A1F6238FBBF9E3609FE96A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_142557_960122_C8B6304A 
X-CRM114-Status: GOOD (  27.65  )
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

T24gVHVlLCBNYXkgMTMsIDIwMjUgYXQgMDY6MDU6MjBQTSArMDgwMCwgQ2hlbiBXYW5nIHdyb3Rl
Ogo+IEFkZGluZyBDaGFybGllLgo+IAo+IEhpLCBDaGFybGllLAo+IAo+IENhbiB5b3UgcGxlYXNl
IGhlbHAgY29uZmlybSB0aGlzPyBJcyB0aGVyZSBzb21ldGhpbmcgd3Jvbmcgd2l0aCBteQo+IHVu
ZGVyc3RhbmRpbmc/IENvcGllZCBoZXJlIGJlbG93IGZvciB5b3VyIHF1aWNrIHJlZmVyZW5jZToK
PiAKPiA+IE9uZSBtb3JlIHF1ZXN0aW9uIGlzIGFib3V0IHdyaXRpbmcgdmFsdWUgb2YgInRoZWFk
LHZsZW5iIi4gU2VlIGJpbmRpbmdzCj4gPiBkZXNjcmlwdGlvbiBpbiBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvcmlzY3YvY3B1cy55YW1sOgo+ID4gCj4gPiBgYGAKPiA+IAo+ID4g
ICAgdGhlYWQsdmxlbmI6Cj4gPiAgICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmlu
aXRpb25zL3VpbnQzMgo+ID4gICAgICBkZXNjcmlwdGlvbjoKPiA+ICAgICAgICBWTEVOLzgsIHRo
ZSB2ZWN0b3IgcmVnaXN0ZXIgbGVuZ3RoIGluIGJ5dGVzLiBUaGlzIHByb3BlcnR5IGlzCj4gPiBy
ZXF1aXJlZCBvbgo+ID4gICAgICAgIHRoZWFkIHN5c3RlbXMgd2hlcmUgdGhlIHZlY3RvciByZWdp
c3RlciBsZW5ndGggaXMgbm90IGlkZW50aWNhbAo+ID4gb24gYWxsIGhhcnRzLCBvcgo+ID4gICAg
ICAgIHRoZSB2bGVuYiBDU1IgaXMgbm90IGF2YWlsYWJsZS4KPiA+IAo+ID4gYGBgCj4gPiAKPiA+
IFdoYXQgSSBhbSBub3Qgc3VyZSBhYm91dCBpcyB3aGV0aGVyIHdlIHNob3VsZCB3cml0ZSAxMjgg
b3IgMTI4Lzg9MTY/Cj4gPiBBc3N1bWluZyBWTEVOIG9mIEM5MTAgaXMgMTI4Yml0Lgo+IAo+IAo+
IFRoYW5rcywgQ2hlbgo+IAo+IE9uIDIwMjUvNS8xMyAxNzoxMywgSGFuIEdhbyB3cm90ZToKPiA+
ID4gQXNzdW1pbmcgVkxFTiBvZiBDOTEwIGlzIDEyOGJpdC4KPiA+IEkgcmVmZXIgdG8gdGhlIHZh
bHVlIG9mIGM5MDYgYmVjYXVzZSBjOTA2IGFuZCBjOTEwL2M5MjB2MSBoYXZlIHRoZSBzYW1lIHZh
bHVlLgo+ID4gCj4gPiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8y
MDI0MTExMy14dGhlYWR2ZWN0b3ItdjExLTMtMjM2YzIyNzkxZWY5QHJpdm9zaW5jLmNvbS8KPiA+
IFsxXQo+ID4gCj4gPiBPbiBUdWUsIE1heSAxMywgMjAyNSBhdCA0OjA24oCvUE0gQ2hlbiBXYW5n
IDx1bmljb3JuX3dhbmdAb3V0bG9vay5jb20+IHdyb3RlOgo+ID4gPiAKPiA+ID4gT24gMjAyNS81
LzEzIDE0OjQ1LCBIYW4gR2FvIHdyb3RlOgo+ID4gPiA+IFlvdSBjYW4gdXNlIHh4ZCB0byBjb252
ZXJ0IGl0Lgo+ID4gPiA+IAo+ID4gPiA+IGNhdCAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2
My9vZl9ub2RlL3RoZWFkLHZsZW5iIHwgeHhkCj4gPiA+ID4gMDAwMDAwMDA6IDAwMDAgMDA4MCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLi4uLgo+ID4gPiA+IAo+ID4gPiA+IFJlZ2Fy
ZHMsCj4gPiA+ID4gSGFuCj4gPiA+IEkgY2FuIHJlYWQgdGhpcyBhZnRlciBkaXNhYmxlIEVSUkFU
QV9USEVBRF9HSE9TVFdSSVRFLgoKWW91IGNhbiBhbHNvIHBhc3MgIm1pdGlnYXRpb25zPW9mZiIg
YXMgYSBrZXJuZWwgYXJnLgoKPiA+ID4gCj4gPiA+IEkgcmVjb21tZW5kIGFkZGluZyBzb21lIGV4
cGxhbmF0aW9uIG5vdGVzIGluIHRoZSBjb21taXQgbWVzc2FnZS4gRm9yCj4gPiA+IGV4YW1wbGUs
IHdoZW4gd2UgbmVlZCB0byBlbmFibGUgeHRoZWFkdmVjdG9yLCB0aGUgcHJlcmVxdWlzaXRlIGlz
IHRvCj4gPiA+IHR1cm4gb2ZmICJFUlJBVEFfVEhFQURfR0hPU1RXUklURSIuCj4gPiA+IEkgZm91
bmQgdGhlIHJlbGV2YW50IHBhdGNoIGlzCj4gPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xp
bnV4LXJpc2N2LzIwMjQxMTEzLXh0aGVhZHZlY3Rvci12MTEtMC0yMzZjMjI3OTFlZjlAcml2b3Np
bmMuY29tLywKPiA+ID4gYWxzbyBob3BlIGFkZGluZyB0aGlzIHdpbGwgaGVscCBsYXRlciBwZW9w
bGUgcXVpY2tseSB1bmRlcnN0YW5kIGFuZAo+ID4gPiBhdm9pZCBteSBtaXN0YWtlcy4KPiA+ID4g
Cj4gPiA+IE9uZSBtb3JlIHF1ZXN0aW9uIGlzIGFib3V0IHdyaXRpbmcgdmFsdWUgb2YgInRoZWFk
LHZsZW5iIi4gU2VlIGJpbmRpbmdzCj4gPiA+IGRlc2NyaXB0aW9uIGluIERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9jcHVzLnlhbWw6Cj4gPiA+IAo+ID4gPiBgYGAKPiA+
ID4gCj4gPiA+ICAgICB0aGVhZCx2bGVuYjoKPiA+ID4gICAgICAgJHJlZjogL3NjaGVtYXMvdHlw
ZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyCj4gPiA+ICAgICAgIGRlc2NyaXB0aW9uOgo+ID4g
PiAgICAgICAgIFZMRU4vOCwgdGhlIHZlY3RvciByZWdpc3RlciBsZW5ndGggaW4gYnl0ZXMuIFRo
aXMgcHJvcGVydHkgaXMKPiA+ID4gcmVxdWlyZWQgb24KPiA+ID4gICAgICAgICB0aGVhZCBzeXN0
ZW1zIHdoZXJlIHRoZSB2ZWN0b3IgcmVnaXN0ZXIgbGVuZ3RoIGlzIG5vdCBpZGVudGljYWwKPiA+
ID4gb24gYWxsIGhhcnRzLCBvcgo+ID4gPiAgICAgICAgIHRoZSB2bGVuYiBDU1IgaXMgbm90IGF2
YWlsYWJsZS4KPiA+ID4gCj4gPiA+IGBgYAo+ID4gPiAKPiA+ID4gV2hhdCBJIGFtIG5vdCBzdXJl
IGFib3V0IGlzIHdoZXRoZXIgd2Ugc2hvdWxkIHdyaXRlIDEyOCBvciAxMjgvOD0xNj8KPiA+ID4g
QXNzdW1pbmcgVkxFTiBvZiBDOTEwIGlzIDEyOGJpdC4KClRoYXQncyBhIGJ1Zy4gSXQgc2hvdWxk
IDE2LCBidXQgSSBoYWQgcHV0IGl0IGFzIDEyOCBmb3IgdGhlIEQxCmRldmljZXRyZWUuCgotIENo
YXJsaWUKCj4gPiA+IAo+ID4gPiBUaGFua3MsCj4gPiA+IAo+ID4gPiBDaGVuCj4gPiA+IAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
