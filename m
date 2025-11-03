Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47B9ECCF9F8
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Nov 2025 07:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tfg5x0P0xJIgh9mJ0IB1qMqFYOZQHO/1XWAs7wJ3O94=; b=jE7t4XBD945wjR
	Wws/4bGWZtO+rob0C8lSX15relgJFKnq2s5GqSvOinV5mJ+QCBy3xYsH6hpb6Tqzhn4KFCZB2r032
	EydYufBLmXmsDQ585yAw/aKdqxtRuTKFttIsL6vIG+S73IwyGNy/BC/e5xwLKqAu8fDkUovKJzkdr
	MlTPIVQXaDEQ0Nk5e6SJ1bbJO2KgTDSyHobSNeqtNmggaNLdzQqiXsthLUqNSAjWiGz9hJPr5NUV+
	L+im4/tXaFcFAQvzR1Kx+ztyG1JXpmoAgeNpexO/xUsUuXGEiJEYmwM0Ok51QP/UNuei3McbpiwIh
	M01eTAZffO9iC9XERTBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFoe4-00000009KQ1-1kzg;
	Mon, 03 Nov 2025 07:06:28 +0000
Received: from mail-ua1-x933.google.com ([2607:f8b0:4864:20::933])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFodz-00000009KPV-32tW
	for linux-riscv@lists.infradead.org;
	Mon, 03 Nov 2025 07:06:27 +0000
Received: by mail-ua1-x933.google.com with SMTP id a1e0cc1a2514c-93515cb8c2bso2370310241.1
        for <linux-riscv@lists.infradead.org>; Sun, 02 Nov 2025 23:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1762153578; x=1762758378; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tM0Sqypkfd4cHla6u/iD2a2fQj8h1TXcjtOfoShr5LM=;
        b=aCINC6WSw/PsRSfJcfhI+KJ0vT2gS47ZSypKo/VzMppuyXW6fJaS2ij2YrwnQerDi5
         YPjL803DsBu9iWXvLcCpwQMwDO20cf5MAEtRnaS082ZjBlZTIenkoCO09D1P3iIuthD0
         cUcQD6AuPI73kFGriL1OuL71feUxc0bm58Umq9vGwi69WPhVlR9W3auXhf0WuhpS7ptE
         T7aUi/i1DsyPjR3SCbTZW/yxhbRNT5RxOi3LbvXdIhROrNLlgmyOtlWTkiBNDelh3QiR
         FH5NLA5gBWIbmdeNI1EGyV/nlAT51osmjKFRpQUyEJ/lArZlPqG5qboipVbym4YTIbqb
         d+Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762153578; x=1762758378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tM0Sqypkfd4cHla6u/iD2a2fQj8h1TXcjtOfoShr5LM=;
        b=VFAgUF1lRrADZZsqWgv9Qrls6DZb2/Nmwrk7LpWSuEiEi6E/tIq7jvUY7d6THpZ8Uo
         xFm8aB7s0k+5qSCPqlr6BIf/nksyjOD+HsVxVlho5VJMmEj3CT2eMp7HVekh/MCm/DJQ
         Vw7Rc/DtvdmCTECOZROoIw2mJyHiyz6pCum+otlWYO6vnmWM3QzO4qlwgDmH9ASAE0K6
         yETZ+y1ApiHHhx9Wm7w9DKxC33dQNqhURuORY7JzlvTtbzdDEKU/hqNUPbYJlMQ/Ced5
         rREwZvylZuAU9iA9uF9YxmNOBeABixUMP/cCPFFYkvdrqdpyXySSRTfHeLZXlaXMpSFd
         l6Kg==
X-Forwarded-Encrypted: i=1; AJvYcCXSV+IGYPL6r88SbwTIg62Ms5+kkk83wv5cjw+g7Md3j55okOLoex3/ESDGeMOjAhuhIA1hZRnrCcxzmw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxTh6jPBAvG5x85bVMWmdv8Ly2gGuVPasaHkXqvd+lh5u1OpD47
	jYjmdlDMmmin3dtUqAG3TvREWG6Gjcy1Q4g6C3MDCSSJU6Aj32Xly4QiXU0Vgjgz0fDlo2E5K2W
	TeAExyCSkL5EIfZA+qDK+HJnwliz78QgWs4jZwlXCdg==
X-Gm-Gg: ASbGncuflH1uVQg0qXo8l0BL4ywNxClIbprUtW60zF0WWaHyEGm6JCN1YQ0wiDVs0rx
	C1C5rbBkw3aKrzEidvYYTJs/2NsOYNeI8pOSvwEOxAkYBY/vjEySqfAk6THd5lEv/hum8czRtiL
	i8+ph1kR9P7GEOGzOx5PKTIr9D59WKd+5qGv997dmr4X+deMnik79K5NjEb3ActUQixwPpy6PlS
	3p53z2PYxxJVb/Hy0jY9wwXUO1uCwpAbnQNgCPXoHuKqh4AXezaLiynKQU159D1oR9ZvQiyLQ==
X-Google-Smtp-Source: AGHT+IHs7mrx8xpghTxCygkbFuODwxkRSqgnQiUmt0E1D8mvwqeld1pU1o4DKGqdJdKB++BoFlBnzksyDL+T6NFPCRk=
X-Received: by 2002:a05:6102:3f4d:b0:5d7:e0ea:8d25 with SMTP id
 ada2fe7eead31-5dbb136920cmr3565508137.38.1762153578086; Sun, 02 Nov 2025
 23:06:18 -0800 (PST)
MIME-Version: 1.0
References: <20251030135652.63837-1-luxu.kernel@bytedance.com> <CAJF2gTTi1=LfmCaMi9vzvUdcqRDqRDRVJ3KEPWdHamk6N01R0w@mail.gmail.com>
In-Reply-To: <CAJF2gTTi1=LfmCaMi9vzvUdcqRDqRDRVJ3KEPWdHamk6N01R0w@mail.gmail.com>
From: Xu Lu <luxu.kernel@bytedance.com>
Date: Mon, 3 Nov 2025 15:06:07 +0800
X-Gm-Features: AWmQ_bmSmZSzIQbr9n7toOdwbaCLdxgSh2Kz3cYihKFgvG7bBn-obgRM3r47pBw
Message-ID: <CAPYmKFtW+T0+=3uVHukTN0BDMMszAez+d342NMRC1xJOmFvVrQ@mail.gmail.com>
Subject: Re: [External] Re: [RFC PATCH v1 0/4] riscv: mm: Defer tlb flush to context_switch
To: Guo Ren <guoren@kernel.org>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	apatel@ventanamicro.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_230623_826286_E9C4F9D6 
X-CRM114-Status: GOOD (  32.11  )
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

SGkgR3VvIFJlbiwKCk9uIE1vbiwgTm92IDMsIDIwMjUgYXQgMTE6NDTigK9BTSBHdW8gUmVuIDxn
dW9yZW5Aa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBUaHUsIE9jdCAzMCwgMjAyNSBhdCA5OjU3
4oCvUE0gWHUgTHUgPGx1eHUua2VybmVsQGJ5dGVkYW5jZS5jb20+IHdyb3RlOgo+ID4KPiA+IFdo
ZW4gbmVlZCB0byBmbHVzaCB0bGIgb2YgYSByZW1vdGUgY3B1LCB0aGVyZSBpcyBubyBuZWVkIHRv
IHNlbmQgYW4gSVBJCj4gPiBpZiB0aGUgdGFyZ2V0IGNwdSBpcyBub3QgdXNpbmcgdGhlIGFzaWQg
d2Ugd2FudCB0byBmbHVzaC4gSW5zdGVhZCwgd2UKPiA+IGNhbiBjYWNoZSB0aGUgdGxiIGZsdXNo
IGluZm8gaW4gcGVyY3B1IGJ1ZmZlciwgYW5kIGRlZmVyIHRoZSB0bGIgZmx1c2gKPiA+IHRvIHRo
ZSBuZXh0IGNvbnRleHRfc3dpdGNoLgo+ID4KPiA+IFRoaXMgcmVkdWNlcyB0aGUgbnVtYmVyIG9m
IElQSSBkdWUgdG8gdGxiIGZsdXNoOgo+ID4KPiA+ICogbHRwIC0gbW1hcHN0cmVzczAxCj4gPiBC
ZWZvcmU6IH4xMDhrCj4gPiBBZnRlcjogfjQ2awo+IEdyZWF0IHJlc3VsdCEKPgo+IEkndmUgc29t
ZSBxdWVzdGlvbnM6Cj4gMS4gRG8gd2UgbmVlZCBhbiBhY2N1cmF0ZSBhZGRyZXNzIGZsdXNoIGJ5
IGEgbmV3IHF1ZXVlIG9mCj4gZmx1c2hfdGxiX3JhbmdlX2RhdGE/IFdoeSBub3QgZmx1c2ggdGhl
IHdob2xlIGFzaWQ/CgpGbHVzaGluZyB0aGUgd2hvbGUgYWRkcmVzcyBzcGFjZSBtYXkgY2F1c2Ug
c3Vic2VxdWVudCB0bGIgbWlzc2VzLgpDb25zaWRlciBzdWNoIGEgY2FzZTogdGhlcmUgaXMgb25s
eSBvbmUgdXNlciBtb2RlIHRocmVhZCBmcmVxdWVudGx5CnJ1bm5pbmcgb24gdGhlIHRhcmdldCBo
YXJ0LiBXaGVuIHRoZSB1c2VyIHRocmVhZCBmYWxscyBhc2xlZXAgYW5kIGNwdQpjb250ZXh0IHN3
aXRjaGVzIHRvIGlkbGUgdGhyZWFkLCBhbm90aGVyIHRocmVhZCBvZiB0aGUgc2FtZSBwcm9jZXNz
CnJ1bm5pbmcgb24gYW5vdGhlciBoYXJ0IG1vZGlmaWVzIHRoZSBtYXBwaW5nIGFuZCBuZWVkcyB0
byBwZXJmb3JtIHRsYgpmbHVzaC4gVGhlIGZpcnN0IHVzZXIgbW9kZSB0aHJlYWQgd2lsbCBlbmNv
dW50ZXIgYSBsYXJnZSBudW1iZXIgb2YgdGxiCm1pc3NlcyB3aGVuIGl0IHJlc3VtZXMuIEkgd2Fu
dCB0byB0cnkgdG8gYmFsYW5jZSB0aGUgaXBpIGNvdW50IGFuZCB0bGIKbWlzc2VzLgoKPiAyLiBJ
ZiB3ZSByZXVzZSB0aGUgY29udGV4dF90bGJfZmx1c2hfcGVuZGluZyBtZWNoYW5pc20sIGNvdWxk
Cj4gbW1hcHN0cmVzczAxIGdhaW4gdGhlIHJlc3VsdCBiZXR0ZXIgdGhhbiB+NDZrPwoKQmVzaWRl
cyBsYXp5IHRsYiBmbHVzaCwgYW5vdGhlciB3YXkgdG8gcmVkdWNlIGlwaSBvdmVyaGVhZCBpcyB0
byBjbGVhbgptbV9jcHVtYXNrLiBBbmQgaXQgZG9lcyBnYWluIGEgYmV0dGVyIHJlc3VsdCBmb3Ig
bW1hcHN0cmVzczAxLiBJIGhhdmUKc2VudCBhIHBhdGNoWzFdIHdoaWNoIGNsZWFycyBtbV9jcHVt
YXNrIHdoZW5ldmVyIGZsdXNoaW5nIGFsbCB0bGIgb2YgYQpjZXJ0YWluIGFzaWQgYW5kIGl0IHJl
ZHVjZXMgdGhlIGlwaSBjb3VudCBmcm9tIH45OGsgdG8gMjY4LgoKQXMgd2FzIG1lbnRpb25lZCBp
biB0aGUgcHJldmlvdXMgZW1haWwsIGluIHRoZSBuZXh0IHZlcnNpb24sIEkgd2lsbApzdXBwbHkg
dGhlIG1tX2NwdW1hc2sgY2xlYXIgcHJvY2VkdXJlLiBTcGVjaWZpY2FsbHksIEkgd2lsbCBmbHVz
aCBhbGwKdGxiIG9mIGFuIGFzaWQgYW5kIGNsZWFyIG1tX2NwdW1hc2sgd2hlbmV2ZXIgaXQgaGFz
bid0IGJlZW4gc2NoZWR1bGVkCmFmdGVyIGVub3VnaCBjb250ZXh0IHN3aXRjaGVzLgoKWzFdIGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI1MDgyNzEzMTQ0NC4yMzg5My0zLWx1eHUua2Vy
bmVsQGJ5dGVkYW5jZS5jb20vCgo+IDMuIElmIHdlIG1lZXQgdGhlIGtlcm5lbCBhZGRyZXNzIHNw
YWNlLCB3ZSBtdXN0IHVzZSBJUEkgZmx1c2gKPiBpbW1lZGlhdGVseSwgYnV0IEkgZGlkbid0IHNl
ZSB5b3VyIHBhdGNoIGNvbnNpZGVyIHRoYXQgY2FzZSwgb3IgYW0gSQo+IHdyb25nPwoKTmljZSBj
YXRjaCEgRm9yZ290IHRvIGFkZCB0aGUga2VybmVsIEFTSUQganVkZ21lbnQgbG9naWMgaW4gdGhl
CnNob3VsZGVkX2lwaV9mbHVzaCBmdW5jdGlvbi4gSSB3aWxsIHN1cHBseSBpdCBpbiB0aGUgbmV4
dCB2ZXJzaW9uLgoKSSBoYXZlIGNvbnNpZGVyZWQgY2FuY2VsaW5nIGlwaSBhbmQgZGVmZXJyaW5n
IHRoZSB0bGIgZmx1c2ggdG8gdGhlCm5leHQgdGltZSB0YXJnZXQgaGFydCBlbnRlcnMgdGhlIHMg
bW9kZSBpZiB0aGUgdGFyZ2V0IGhhcnQgaXMgbm93CnJ1bm5pbmcgaW4gdXNlciBtb2RlLiBCdXQg
dGhlcmUgYXJlIHRvbyBtYW55IGtlcm5lbCBlbnRyeSBwb2ludHMgdG8KY29uc2lkZXIsIGVzcGVj
aWFsbHkgbm93IHdlIGhhdmUgc3NlLiBGb3Iga2VybmVsIHRsYiBmbHVzaCwgaXQgbWF5IGJlCm1v
cmUgc2VjdXJlIHRvIHNlbmQgaXBpLiBUaGFua3MuCgpCZXN0IFJlZ2FyZHMsClh1IEx1Cgo+Cj4g
Pgo+ID4gRnV0dXJlIHBsYW4gaW4gdGhlIG5leHQgdmVyc2lvbjoKPiA+Cj4gPiAtIFRoaXMgcGF0
Y2ggc2VyaWVzIHJlZHVjZXMgSVBJIGJ5IGRlZmVycmluZyB0bGIgZmx1c2ggdG8KPiA+IGNvbnRl
eHRfc3dpdGNoLiBJdCBkb2VzIG5vdCBjbGVhciB0aGUgbW1fY3B1bWFzayBvZiB0YXJnZXQgbW1f
c3RydWN0LiBJbgo+ID4gdGhlIG5leHQgdmVyc2lvbiwgSSB3aWxsIGFwcGx5IGEgdGhyZXNob2xk
IHRvIHRoZSBudW1iZXIgb2YgQVNJRHMKPiA+IG1haW50YWluZWQgYnkgZWFjaCBjcHUncyB0bGIu
IE9uY2UgdGhlIHRocmVzaG9sZCBpcyBleGNlZWRlZCwgQVNJRCB0aGF0Cj4gPiBoYXMgbm90IGJl
ZW4gdXNlZCBmb3IgdGhlIGxvbmdlc3QgdGltZSB3aWxsIGJlIGZsdXNoZWQgb3V0LiBBbmQgY3Vy
cmVudAo+ID4gY3B1IHdpbGwgYmUgY2xlYXJlZCBpbiB0aGUgbW1fY3B1bWFzay4KPiA+Cj4gPiBU
aGFua3MgaW4gYWR2YW5jZSBmb3IgeW91ciBjb21tZW50cy4KPiA+Cj4gPiBYdSBMdSAoNCk6Cj4g
PiAgIHJpc2N2OiBtbTogSW50cm9kdWNlIHBlcmNwdSBsb2FkZWRfYXNpZAo+ID4gICByaXNjdjog
bW06IEludHJvZHVjZSBwZXJjcHUgdGxiIGZsdXNoIHF1ZXVlCj4gPiAgIHJpc2N2OiBtbTogRW5x
dWV1ZSB0bGJmbHVzaCBpbmZvIGlmIHRhc2sgaXMgbm90IHJ1bm5pbmcgb24gdGFyZ2V0IGNwdQo+
ID4gICByaXNjdjogbW06IFBlcmZvcm0gdGxiIGZsdXNoIGR1cmluZyBjb250ZXh0X3N3aXRjaAo+
ID4KPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL21tdV9jb250ZXh0LmggfCAgMSArCj4gPiAg
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS90bGJmbHVzaC5oICAgIHwgIDQgKysKPiA+ICBhcmNoL3Jp
c2N2L21tL2NvbnRleHQuYyAgICAgICAgICAgICAgfCAxMCArKysrCj4gPiAgYXJjaC9yaXNjdi9t
bS90bGJmbHVzaC5jICAgICAgICAgICAgIHwgNzYgKysrKysrKysrKysrKysrKysrKysrKysrKysr
LQo+ID4gIDQgZmlsZXMgY2hhbmdlZCwgOTAgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+
ID4KPiA+IC0tCj4gPiAyLjIwLjEKPiA+Cj4KPgo+IC0tCj4gQmVzdCBSZWdhcmRzCj4gIEd1byBS
ZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
