Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18B0EC4167D
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Nov 2023 18:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EOE3j88hzC5XUR80mLlejzQvqCZwKWJbWRl35TUdtD4=; b=n7tKIZ4ygxqvb+
	ZGXhNCxX541bRiW8XKSR2zAbwxOXs80R2ha51Z8NREv3TbmaxZ3PoMEzfjNNXqu83GVIXwemVDiZt
	AXn4/sadOBMemtHQn7eFR804FAn5ykwGj5DAqXmgr/Agw6YHtcE3SdU9gcYoXGiwZAQkJ3j73qDP8
	CargJJdmPBVdRwGBDH8xDqBa/e3lIHHYdxdFFGqyXojM4Rx2MpdFYKYMe8RjwEo4Lcz0bRfyYVcG7
	XGa1JjNHOV26LbFtyd6J8TRdrxeVGFW7sYMSwWuaCTxmFPivIQ/LMBMOmYcFWtomsodg020uyGn0F
	fBtM8OgeIOaxT2nWex6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyypM-00BxUm-1D;
	Fri, 03 Nov 2023 18:23:28 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyypE-00BxTA-1d
	for linux-riscv@lists.infradead.org;
	Fri, 03 Nov 2023 18:23:26 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2c50ec238aeso33576861fa.0
        for <linux-riscv@lists.infradead.org>; Fri, 03 Nov 2023 11:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699035797; x=1699640597; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7L/JnhoP1I1IV3t09zBtQ/9SwF5NvE0r64reb+C7F0U=;
        b=QMQbqrP42mp+DFHrYyDjRl5Wx9ARWsQeaUJsyewdS2E27qN6U15Z6v/KX+rgvutZ4K
         XAzCwye2Ul2cxZ4lLr7PhyWTuhX/0iLPECHWZ4olbUDd5cNiIxtYSaYbe8msEMcWcpRq
         hfa/2RZu3Bi8YHE8ACb8hrzBXne7Nsxo3BMXCxv1F9oT0GorU5By4ymvxEYWBR6cqH4T
         6YNuJADeScZvvIRu5177AMwu4Dw2St4UKTZjgacWuUvIuhrnqO4ST43aB4pf507cWb6+
         vACpr7HPH7YKGPz38P1cAQ1SgSCBe+sQuWNYucFZKQHAIxAq27pReMnTT0JSykK8XqlU
         doQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699035797; x=1699640597;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7L/JnhoP1I1IV3t09zBtQ/9SwF5NvE0r64reb+C7F0U=;
        b=XSRFvySiBXck/B6J/T/evMA+sc9dVzwPQDzC4H5fczgQij9oc5m5cvUoOj5yxgjZre
         db94Mx9mHFCPQZ42FvtzrqwYfZM/ZtCrKcsCbS2taLt0RRoujSXnR12Iq4ijEU1KYWWf
         l6tOMnS05kdtYRz2XDbnBNWGNDOJUWb+VuURRhD/DGByQTdNR+TsO9muBiFSUHI4y9mS
         j37y5zVjRWJtFtEnstsFB3UI+95RBc53YkNPO9EqAI+iAFE1j/GntLm+On2wHLWvV8Zl
         JDCGGKMbLH3apX+qgL9gfR0cOwu1H8ZmyYlb+zWqARoge360w3ysZR8UUowj4Etvvfh6
         GJ4g==
X-Gm-Message-State: AOJu0YxZXJw5+xp4zPZKCe/Rs81UdOTuSf2NO6cBGIu4l8lr+Q8aqh4I
	7lvH7LhTcT7Kd9J/hHS1PJSghf9WZ59DMlTdAapwIw==
X-Google-Smtp-Source: AGHT+IFJH1/xAYK0iBADVJnydOuqpcNAyexzetfc6RbL8HxRDJ5dx8tx/aHUOvNuYbs98x1IS/G6FnQ4MPOoUklwmbk=
X-Received: by 2002:a2e:a4c6:0:b0:2c0:2ab7:9ab1 with SMTP id
 p6-20020a2ea4c6000000b002c02ab79ab1mr16517611ljm.35.1699035796898; Fri, 03
 Nov 2023 11:23:16 -0700 (PDT)
MIME-Version: 1.0
References: <20231031143521.441-1-jszhang@kernel.org> <20231031153242.k9tLdSby@linutronix.de>
 <ZUEiCUxcd11inlRP@xhacker> <20231031164411.9YRGasL-@linutronix.de>
 <ZUI5h6eIhTlPAmGh@xhacker> <20231102-spearman-overcrowd-a86bfb958609@wendy>
 <20231102155423.SyuAibSe@linutronix.de> <20231103-army-gloater-af710df04628@spud>
 <20231103082411.f_ZU1E7V@linutronix.de> <CALs-HstDSr6arKw+b-HWbEQAgQCNbicJv4H-UKAooa8VxcpnMw@mail.gmail.com>
 <20231103173936.OHevJ107@linutronix.de>
In-Reply-To: <20231103173936.OHevJ107@linutronix.de>
From: Evan Green <evan@rivosinc.com>
Date: Fri, 3 Nov 2023 11:22:40 -0700
Message-ID: <CALs-Hsun_6SfdWXHPx-D4djhrKTfwCSm4rkMpt68i+djyDb+RQ@mail.gmail.com>
Subject: Re: [PATCH RT v2 0/3] riscv: add PREEMPT_RT support
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Conor Dooley <conor@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	tobias.schaffner@siemens.com, Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231103_112320_884359_6AF5103A 
X-CRM114-Status: GOOD (  34.23  )
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

T24gRnJpLCBOb3YgMywgMjAyMyBhdCAxMDozOeKAr0FNIFNlYmFzdGlhbiBBbmRyemVqIFNpZXdp
b3IKPGJpZ2Vhc3lAbGludXRyb25peC5kZT4gd3JvdGU6Cj4KPiBPbiAyMDIzLTExLTAzIDEwOjE5
OjQ5IFstMDcwMF0sIEV2YW4gR3JlZW4gd3JvdGU6Cj4gPiBIaSBTZWJhc3RpZW4sCj4KPiBIaSBF
dmFuLAo+Cj4gPiBDb3VsZCB5b3UgZWxhYm9yYXRlIGEgbGl0dGxlIG9uIHRoZSBydWxlIHZpb2xh
dGlvbiBoZXJlPyBUaGUKPiA+IGRvY3VtZW50YXRpb24gZm9yIEdGUF9OT1dBSVQgc2F5czoKPiA+
Cj4gPiA+IElmIHRoZSBhbGxvY2F0aW9uIGlzIHBlcmZvcm1lZCBmcm9tIGFuIGF0b21pYyBjb250
ZXh0LCBlLmcgaW50ZXJydXB0Cj4gPiA+IGhhbmRsZXIsIHVzZSBgYEdGUF9OT1dBSVRgYC4KPiA+
Cj4gPiB3aGljaCBzZWVtcyBsaWtlIGl0IGJhc2ljYWxseSBmaXRzIG15IHNpdHVhdGlvbi4gSWYg
SSBkbyBhIHNlYXJjaCBmb3IKPiA+IEdGUF9OT1dBSVQgdG8gaHVudCBmb3IgaW5zdGFuY2VzIG9m
IGFsbG9jYXRpbmcgd2l0aCBpbnRlcnJ1cHRzCj4gPiBkaXNhYmxlZCwgSSBzZWUgYXQgbGVhc3Qg
dGhlIGZvbGxvd2luZyBleGFtcGxlcyAobW9yZSBhdmFpbGFibGUgdXBvbgo+ID4gcmVxdWVzdCk6
Cj4KPiBXZSB0YWxrIGhlcmUgYWJvdXQgUFJFRU1QVF9SVC4gVGhlIGVhcmx5LUNQVSB1cCBvciBh
IFNNUC1mdW5jdGlvbiBjYWxscwo+IGhhcHBlbnMgaW4gaGFyZGlycSBjb250ZXh0IHdpdGggZGlz
YWJsZWQgaW50ZXJydXB0cy4gQWx3YXlzLgo+IFRoZSBzZXF1ZW5jZQo+ICAgICAgICAgc3Bpbl9s
b2NrX2lycSgpOwo+ICAgICAgICAga21hbGxvYygsIEdGUF9BVE9NSUMpOwo+Cj4gaXMgZmluZSBi
ZWNhdXNlIG9uIFBSRUVNUFRfUlQgc3Bpbl9sb2NrX2lycSgpIGRvZXMgbm90IHJlYWxseSBkaXNh
YmxlCj4gaW50ZXJydXB0cyBhbmQgdGhlIHNwaW5fbG9ja190IGJlY29tZXMgYSBzbGVlcGluZyBs
b2NrLiBTZWUKPiAgICAgICAgIGh0dHBzOi8vZG9jcy5rZXJuZWwub3JnL2xvY2tpbmcvbG9ja3R5
cGVzLmh0bWwKPgoKVGhhbmtzLCB0aGF0IHBhZ2UgaGVscHMuIFBSRUVNUFRfUlQgaXMgd2lsZCA6
KQoKPiBUaGUgcHJvYmxlbSBpcyB0aGF0IHNsZWVwaW5nIGxvY2tzIG11c3QgYmUgYWNxdWlyZWQg
aW4gYSBjb250ZXh0IHdoZXJlCj4gc2xlZXBpbmcgaXMgbm90IHBvc3NpYmxlLiBBbmQga21hbGxv
YygpIG1heSBuZWVkIHRvIGFjcXVpcmUgc2xlZXBpbmcKPiBsb2Nrcy4gVGhlcmVmb3JlIG5vIG1l
bW9yeSBhbGxvY2F0aW9ucyBpbiBJUlEtb2ZmIHNlY3Rpb25zLgo+Cj4gPiBGaW5kaW5nIHRoZSBk
b2N1bWVudGF0aW9uIHRoYXQgc3RhdGVzIHRoaXMgaXMgaWxsZWdhbCBtaWdodCBoZWxwIG1lCj4g
PiB1bmRlcnN0YW5kIHdoYXQgSSBzaG91bGQgYmUgZG9pbmcgaW5zdGVhZC4gRm9yIGV4YW1wbGUs
IEknbSBmdXp6eSBvbgo+ID4gc29tZXRoaW5nIHRoYXQncyBkaXNhbGxvd2VkIHdoZW4gaW50ZXJy
dXB0cyBhcmUgZGlzYWJsZWQgYnV0IG9rIGluCj4gPiBzbXBfY2FsbGluKCkuCj4KPiBzbXBfY2Fs
bGluKCkgaXMgdGhlIFNNUCBmdW5jdGlvbnMgY2FsbCBzbyBpdCBpcyBub3Qgb2theS4gSGF2aW5n
IGEKPiBrd29ya2VyIHdvdWxkIG9rYXkgZm9yIGluc3RhbmNlLiBUaGlzIGhvd2V2ZXIgcmVxdWly
ZXMgYSBmdWxseSBzZXR1cAo+IHNjaGVkdWxlci4gSGF2aW5nIHRoZSBtZW1vcnkgYWxsb2NhdGVk
IHVwZnJvbnQgYW5kIHBhc3NpbmcgdG8gZXZlcnkgQ1BVCj4gd291bGQgd29yayBmaW5lLCB0b28u
Cj4KPiA+IE9uZSBvcHRpb24gaXMgdG8gZG8gYWxsIHRoZSBhbGxvY2F0aW9ucyBpbgo+ID4gY2hl
Y2tfdW5hbGlnbmVkX2FjY2Vzc19hbGxfY3B1cygpLCBhbmQgcGFzcyB0aGVtIGluLCBidXQgdW50
aWwgSSBjYW4KPiA+IGZpbmQgdGhlIHJ1bGVzIGl0J3MgaGFyZCB0byB2ZXJpZnkgdGhhdCdzIGEg
Y29ycmVjdCBmaXguIEl0J3MgYWxzbyBhCj4gPiBsaXR0bGUgY2x1bmt5LCBhbmQgd291bGRuJ3Qg
YXBwbHkgdG8gdGhlIGhvdHBsdWcgcGF0aCwgc28gSSB3YW50IHRvCj4gPiBtYWtlIHN1cmUgaXQn
cyBuZWNlc3NhcnkgYW5kIHN1ZmZpY2llbnQgYmVmb3JlIGVtYmFya2luZyBvbiB0aGF0Cj4gPiBq
b3VybmV5Lgo+Cj4gSSBkb24ndCBrbm93IHdoYXQgaXQgZG9lcyBhbmQgaG93IG9mdGVuIGl0IG5l
ZWRzIHRvIGJlIGRvbmUuIFRoZQo+IHF1ZXN0aW9uIGlzIHdvdWxkIGl0IGJlIG9rYXkgdG8gZG8g
b25jZSBvbiBzeXN0ZW0gYm9vdCBvciBkb2VzIGl0IG5lZWQKPiB0byBiZSBkb25lIGVhY2ggdGlt
ZSB0aGUgQ1BVIGdvZXMgdXA/IElzIGl0IHJlcXVpcmVkIHRvIGJlIHRoZSBmaXJzdAo+IHRoaW5n
IGl0IGRvZXMgb3IgY2FuIGl0IGJlIGRlbGF5ZWQgdG8gc2xpZ2h0bHkgbGF0ZXIgcG9pbnQgaW4g
dGltZT8KCkl0J3MgZXNzZW50aWFsbHkgYSBjaGFyYWN0ZXJpemF0aW9uIHdlIGRvIG9uIGVhY2gg
Q1BVIHRvIGZpZ3VyZSBvdXQgaWYKbWlzYWxpZ25lZCB3b3JkIGFjY2Vzc2VzIGFyZSBmYXN0IG9y
IHNsb3cuIFRoaXMgaW5mbyBpcyByZXBvcnRlZCB0bwp1c2VybW9kZSwgYW5kIHBvdGVudGlhbGx5
IGhhcyBrZXJuZWwgY29uc3VtZXJzIGFzIHdlbGwgKENoYXJsaWUncyBpcApjaGVja3N1bW1pbmcg
c2VyaWVzIHdhbnRzIHRvIGZsaXAgYSBzdGF0aWMgYnJhbmNoIGJhc2VkIG9uIGl0KS4KCkluIGEg
c2Vuc2UgSSBiYXJlbHkgbmVlZCB0aGUgYnVmZmVyLCB0aGUgYnVmZmVyIGlzIGp1c3QgYSBydW53
YXkgSSB1c2UKdG8gZG8gZHVtbXkgbWVtY3B5cyBhY3Jvc3MuIEkgbmVlZCB0byBkbyBpdCBvbmNl
IG9uIGJvb3QgZm9yIGVhY2ggQ1BVLAphbmQgZm9yIGFueSBhZGRpdGlvbmFsIENQVXMgdGhhdCBz
aG93IHVwIHZpYSBob3RwbHVnLiBJdCBkb2VzIG5vdCBuZWVkCnRvIGJlIGRvbmUgYWNyb3NzIHN1
c3BlbmQvcmVzdW1lLgoKVGhlIHBhdGNoIGluIHF1ZXN0aW9uIHdhcyBhbiBhdHRlbXB0IHRvIG1v
dmUgdGhpcyB3b3JrIHRvIGJlIGRvbmUgaW4KcGFyYWxsZWwsIHNpbmNlIG9uIHN5c3RlbXMgd2l0
aCBsb3RzIG9mIENQVXMsIGRvaW5nIGl0IHNlcmlhbGx5IGluCnNtcF9jYWxsaW4oKSB3YXMgY2F1
c2luZyBib290IHRpbWUgcmVncmVzc2lvbnMuCgpGb3IgYm9vdCwgSSB0aGluayB0aGUgcGxhbiBJ
IG91dGxpbmVkIHNob3VsZCB3b3JrOiBhbGxvY2F0ZSBhbGwgcGFnZXMKaW4gdGhlIGluaXRjYWxs
IGJlZm9yZSBjYWxsaW5nIG9uX2VhY2hfY3B1KCkuIEZvciBob3RwbHVnLCBJJ2xsIGhhdmUKdG8g
ZmluZCBhIHNwb3QgdG8gYWxsb2NhdGUgYSBidWZmZXIgYmVmb3JlIHRoZSBDUFUgY29tZXMgdXAs
IHNvIGl0IGNhbgp1c2UgaXQgaW4gc21wX2NhbGxpbigpLgoKUGFsbWVyJ3MgZHJvcHBlZCB0aGlz
IHBhdGNoIGZvciBub3csIHNvIEknbGwgcGxhbiB0byBzcGluIHdpdGggdGhvc2UKY2hhbmdlcyB1
bmxlc3MgYW55b25lIGhhcyB0aG91Z2h0cyBvbiB0aGlzIGFwcHJvYWNoLgotRXZhbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
