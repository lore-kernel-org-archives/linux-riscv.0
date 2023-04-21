Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85746C77B76
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Apr 2023 18:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MkkUWoCoDMlELRma3gcX7TdN358B4kREvAr0WOXOlFw=; b=OWSa8K1Wq4/fNY
	Ws5aaowQZKpWDxa998MwJuWv3o/D1oazNVELDTMD5R1zcZItGqIblWXVG3DL52CaygLGXeu87xxdF
	ifj0d0mtZUSxHl/YABdYYYWThZ6JpAFtCUx9NgMGbbT7fARpbTc70oSeZxgXVkIFY6yK/6KlkNj+a
	ZJApKnSynewYQ0Ye1KNmxN995/Yu4JGqYRb4pF0sff440ngI0VLFbYrIQLfNLmoEg0t1TIpNGgVPK
	cMYSsGVulQlVIyoPu+CEDO+ZU/u7WOljrIS9U8hrUaN1AMp8r7dBLgg64uW3ubiN5It5oMLSqgAgG
	BGs4Rhu2rR1Ap+hx7ovg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppvpx-00Bf8o-20;
	Fri, 21 Apr 2023 18:50:25 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppvpt-00Bf6b-2c
	for linux-riscv@lists.infradead.org;
	Fri, 21 Apr 2023 18:50:23 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1a526aa3dd5so27770755ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 21 Apr 2023 11:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1682103019; x=1684695019;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/IIUhUlmRecN66Z6gik+9JylRPrSHv9qYt9esJpbqSI=;
        b=THDL4+u/vOfwLaOnCW6eh/CjgCzPbUBKAHWf1LgoVb5urObrbbDHtE6LnFnJmkcGbJ
         X8sScn53VOwmiufg6b6vh6lFIqrfOMJmRlqDY7muic2fAlWCCsOBcmJbCjOoIvNUxnTw
         CCi7AskMw6mhK+++me+sRjwikLpeFgIwFV0nF0mmjg428f8Rammes3zg4WwGMq8g786W
         u8Qe//FfgFBTmm/8czZ4ckylnzNPDOezoP2aS60VK1m3/oMe/h5ZP8lwmqiqiNZdCveU
         hRoUCo88MTFudnwN/fMDvgNm+b5CVsDTOcg14bYbIUZFekjOGitMEoCJ5+oTpJJu4z/U
         HanA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682103019; x=1684695019;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/IIUhUlmRecN66Z6gik+9JylRPrSHv9qYt9esJpbqSI=;
        b=T4f2HK6rQOBS+iMRnXy7Fcc5iHN5Qo/s1xzgcbrKJLU1nar++TUkmdcHNPyhp1YF2C
         MV4eG/XStoGuUKFaghSdU9POs9V94TZ0QOfXHWhgi+F53djQqnIb7udrSn5GbBV1C2e9
         rXlv0bMhDzSSykbD9nEDm5U1rfcZzqjkGolj9BOhNvUIfkIH4q5GTrj6Vb54ffJ7kAxQ
         S3I8TrnXSoxyE+WVIG6mpwI/7+RLq1WxEixwFLSQicma+mPqZB3RjVaqUnT/En1TqR2v
         fwv3MWHCoNx1sR1LQAaZIaQ3vLepZDNfFPxoaBBlc7jEKw6ov6mDolTcPLTxhi6Dbkdv
         a6TQ==
X-Gm-Message-State: AAQBX9dNIWWb/L2h7wbXErA2F8vQpgayRvF5ErlNmr6dEOAe1yZQ0T8q
	1fjUl33gYY9PItXgj2/+TbdINbozT6lly4egm+X6Lg==
X-Google-Smtp-Source: AKy350YdSljDnRrQJM9jfWzeZ/GLttvpy4dWrgL7+90Nmaems+z3L9naUfpMZAy9sq8Fz7lbqPOj5hZdKf+W5l/Qavg=
X-Received: by 2002:a17:902:8501:b0:1a1:f95a:24f2 with SMTP id
 bj1-20020a170902850100b001a1f95a24f2mr5252822plb.19.1682103019136; Fri, 21
 Apr 2023 11:50:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230419221716.3603068-1-atishp@rivosinc.com> <20230419221716.3603068-11-atishp@rivosinc.com>
 <ZEFXiXu+0XLSdRkQ@google.com>
In-Reply-To: <ZEFXiXu+0XLSdRkQ@google.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Sat, 22 Apr 2023 00:20:08 +0530
Message-ID: <CAHBxVyGGsvYrRpx1=ahW-5ALskAQJsgjF=9a=BMreuQov0En6Q@mail.gmail.com>
Subject: Re: [RFC 10/48] RISC-V: KVM: Implement static memory region measurement
To: Sean Christopherson <seanjc@google.com>
Cc: linux-kernel@vger.kernel.org, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Jones <ajones@ventanamicro.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	linux-coco@lists.linux.dev, Dylan Reid <dylan@rivosinc.com>, abrestic@rivosinc.com, 
	Samuel Ortiz <sameo@rivosinc.com>, Christoph Hellwig <hch@infradead.org>, 
	Conor Dooley <conor.dooley@microchip.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guo Ren <guoren@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Jiri Slaby <jirislaby@kernel.org>, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
	Mayuresh Chitale <mchitale@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Rajnesh Kanwal <rkanwal@rivosinc.com>, Uladzislau Rezki <urezki@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_115022_013995_B8B8B4C9 
X-CRM114-Status: GOOD (  28.42  )
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

T24gVGh1LCBBcHIgMjAsIDIwMjMgYXQgODo0N+KAr1BNIFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNl
YW5qY0Bnb29nbGUuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgQXByIDE5LCAyMDIzLCBBdGlzaCBQ
YXRyYSB3cm90ZToKPiA+ICtpbnQga3ZtX3Jpc2N2X2NvdmVfdm1fbWVhc3VyZV9wYWdlcyhzdHJ1
Y3Qga3ZtICprdm0sIHN0cnVjdCBrdm1fcmlzY3ZfY292ZV9tZWFzdXJlX3JlZ2lvbiAqbXIpCj4g
PiArewo+ID4gKyAgICAgc3RydWN0IGt2bV9jb3ZlX3R2bV9jb250ZXh0ICp0dm1jID0ga3ZtLT5h
cmNoLnR2bWM7Cj4gPiArICAgICBpbnQgcmMgPSAwLCBpZHgsIG51bV9wYWdlczsKPiA+ICsgICAg
IHN0cnVjdCBrdm1fcmlzY3ZfY292ZV9tZW1fcmVnaW9uICpjb25mOwo+ID4gKyAgICAgc3RydWN0
IHBhZ2UgKnBpbm5lZF9wYWdlLCAqY29uZl9wYWdlOwo+ID4gKyAgICAgc3RydWN0IGt2bV9yaXNj
dl9jb3ZlX3BhZ2UgKmNwYWdlOwo+ID4gKwo+ID4gKyAgICAgaWYgKCF0dm1jKQo+ID4gKyAgICAg
ICAgICAgICByZXR1cm4gLUVGQVVMVDsKPiA+ICsKPiA+ICsgICAgIGlmICh0dm1jLT5maW5hbGl6
ZWRfZG9uZSkgewo+ID4gKyAgICAgICAgICAgICBrdm1fZXJyKCJtZWFzdXJlZF9tciBwYWdlcyBj
YW4gbm90IGJlIGFkZGVkIGFmdGVyIGZpbmFsaXplXG4iKTsKPiA+ICsgICAgICAgICAgICAgcmV0
dXJuIC1FSU5WQUw7Cj4gPiArICAgICB9Cj4gPiArCj4gPiArICAgICBudW1fcGFnZXMgPSBieXRl
c190b19wYWdlcyhtci0+c2l6ZSk7Cj4gPiArICAgICBjb25mID0gJnR2bWMtPmNvbmZpZGVudGlh
bF9yZWdpb247Cj4gPiArCj4gPiArICAgICBpZiAoIUlTX0FMSUdORUQobXItPnVzZXJzcGFjZV9h
ZGRyLCBQQUdFX1NJWkUpIHx8Cj4gPiArICAgICAgICAgIUlTX0FMSUdORUQobXItPmdwYSwgUEFH
RV9TSVpFKSB8fCAhbXItPnNpemUgfHwKPiA+ICsgICAgICAgICAhY292ZV9pc193aXRoaW5fcmVn
aW9uKGNvbmYtPmdwYSwgY29uZi0+bnBhZ2VzIDw8IFBBR0VfU0hJRlQsIG1yLT5ncGEsIG1yLT5z
aXplKSkKPiA+ICsgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gPiArCj4gPiArICAgICBp
ZHggPSBzcmN1X3JlYWRfbG9jaygma3ZtLT5zcmN1KTsKPiA+ICsKPiA+ICsgICAgIC8qVE9ETzog
SXRlcmF0ZSBvbmUgcGFnZSBhdCBhIHRpbWUgYXMgcGlubmluZyBtdWx0aXBsZSBwYWdlcyBmYWls
IHdpdGggdW5tYXBwZWQgcGFuaWMKPiA+ICsgICAgICAqIHdpdGggYSB2aXJ0dWFsIGFkZHJlc3Mg
cmFuZ2UgYmVsb25naW5nIHRvIHZtYWxsb2MgcmVnaW9uIGZvciBzb21lIHJlYXNvbi4KPgo+IEkn
dmUgbm8gaWRlYSB3aGF0IGNvZGUgeW91IGhhZCwgYnV0IEkgc3VzcGVjdCB0aGUgZmFjdCB0aGF0
IHZtYWxsb2MnZCBtZW1vcnkgaXNuJ3QKPiBndWFyYW50ZWVkIHRvIGJlIHBoeXNpY2FsbHkgY29u
dGlndW91cyBpcyByZWxldmFudCB0byB0aGUgcGFuaWMuCj4KCkFoaC4gVGhhdCBtYWtlcyBzZW5z
ZS4gVGhhbmtzLgoKPiA+ICsgICAgICAqLwo+ID4gKyAgICAgd2hpbGUgKG51bV9wYWdlcykgewo+
ID4gKyAgICAgICAgICAgICBpZiAoc2lnbmFsX3BlbmRpbmcoY3VycmVudCkpIHsKPiA+ICsgICAg
ICAgICAgICAgICAgICAgICByYyA9IC1FUkVTVEFSVFNZUzsKPiA+ICsgICAgICAgICAgICAgICAg
ICAgICBicmVhazsKPiA+ICsgICAgICAgICAgICAgfQo+ID4gKwo+ID4gKyAgICAgICAgICAgICBp
ZiAobmVlZF9yZXNjaGVkKCkpCj4gPiArICAgICAgICAgICAgICAgICAgICAgY29uZF9yZXNjaGVk
KCk7Cj4gPiArCj4gPiArICAgICAgICAgICAgIHJjID0gZ2V0X3VzZXJfcGFnZXNfZmFzdChtci0+
dXNlcnNwYWNlX2FkZHIsIDEsIDAsICZwaW5uZWRfcGFnZSk7Cj4gPiArICAgICAgICAgICAgIGlm
IChyYyA8IDApIHsKPiA+ICsgICAgICAgICAgICAgICAgICAgICBrdm1fZXJyKCJQaW5uaW5nIHRo
ZSB1c2VycHNhY2UgYWRkciAlbHggZmFpbGVkXG4iLCBtci0+dXNlcnNwYWNlX2FkZHIpOwo+ID4g
KyAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+ID4gKyAgICAgICAgICAgICB9Cj4gPiArCj4g
PiArICAgICAgICAgICAgIC8qIEVub3VnaCBwYWdlcyBhcmUgbm90IGF2YWlsYWJsZSB0byBiZSBw
aW5uZWQgKi8KPiA+ICsgICAgICAgICAgICAgaWYgKHJjICE9IDEpIHsKPiA+ICsgICAgICAgICAg
ICAgICAgICAgICByYyA9IC1FTk9NRU07Cj4gPiArICAgICAgICAgICAgICAgICAgICAgYnJlYWs7
Cj4gPiArICAgICAgICAgICAgIH0KPiA+ICsgICAgICAgICAgICAgY29uZl9wYWdlID0gYWxsb2Nf
cGFnZShHRlBfS0VSTkVMIHwgX19HRlBfWkVSTyk7Cj4gPiArICAgICAgICAgICAgIGlmICghY29u
Zl9wYWdlKSB7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgcmMgPSAtRU5PTUVNOwo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+ID4gKyAgICAgICAgICAgICB9Cj4gPiArCj4gPiAr
ICAgICAgICAgICAgIHJjID0gY292ZV9jb252ZXJ0X3BhZ2VzKHBhZ2VfdG9fcGh5cyhjb25mX3Bh
Z2UpLCAxLCB0cnVlKTsKPiA+ICsgICAgICAgICAgICAgaWYgKHJjKQo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgIGJyZWFrOwo+ID4gKwo+ID4gKyAgICAgICAgICAgICAvKlRPRE86IFN1cHBvcnQg
b3RoZXIgcGFnZXMgc2l6ZXMgKi8KPiA+ICsgICAgICAgICAgICAgcmMgPSBzYmlfY292aF9hZGRf
bWVhc3VyZWRfcGFnZXModHZtYy0+dHZtX2d1ZXN0X2lkLCBwYWdlX3RvX3BoeXMocGlubmVkX3Bh
Z2UpLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBw
YWdlX3RvX3BoeXMoY29uZl9wYWdlKSwgU0JJX0NPVkVfUEFHRV80SywKPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMSwgbXItPmdwYSk7Cj4gPiArICAg
ICAgICAgICAgIGlmIChyYykKPiA+ICsgICAgICAgICAgICAgICAgICAgICBicmVhazsKPiA+ICsK
PiA+ICsgICAgICAgICAgICAgLyogVW5waW4gdGhlIHBhZ2Ugbm93ICovCj4gPiArICAgICAgICAg
ICAgIHB1dF9wYWdlKHBpbm5lZF9wYWdlKTsKPiA+ICsKPiA+ICsgICAgICAgICAgICAgY3BhZ2Ug
PSBrbWFsbG9jKHNpemVvZigqY3BhZ2UpLCBHRlBfS0VSTkVMX0FDQ09VTlQpOwo+ID4gKyAgICAg
ICAgICAgICBpZiAoIWNwYWdlKSB7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgcmMgPSAtRU5P
TUVNOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+ID4gKyAgICAgICAgICAgICB9
Cj4gPiArCj4gPiArICAgICAgICAgICAgIGNwYWdlLT5wYWdlID0gY29uZl9wYWdlOwo+ID4gKyAg
ICAgICAgICAgICBjcGFnZS0+bnBhZ2VzID0gMTsKPiA+ICsgICAgICAgICAgICAgY3BhZ2UtPmdw
YSA9IG1yLT5ncGE7Cj4gPiArICAgICAgICAgICAgIGNwYWdlLT5odmEgPSBtci0+dXNlcnNwYWNl
X2FkZHI7Cj4KPiBTbmFwc2hvdHRpbmcgdGhlIHVzZXJzcGFjZSBhZGRyZXNzIGZvciB0aGUgX3Nv
dXJjZV8gcGFnZSBjYW4ndCBwb3NzaWJseSBiZSB1c2VmdWwuCj4KClllYWguIEN1cnJlbnRseSwg
dGhlIGh2YSBpbiB0aGUga3ZtX3Jpc2N2X2NvdmVfcGFnZSBpcyBub3QgdXNlZAphbnl3aGVyZSBp
biB0aGUgY29kZS4gV2UgY2FuIHJlbW92ZSBpdC4KCj4gPiArICAgICAgICAgICAgIGNwYWdlLT5p
c19tYXBwZWQgPSB0cnVlOwo+ID4gKyAgICAgICAgICAgICBJTklUX0xJU1RfSEVBRCgmY3BhZ2Ut
PmxpbmspOwo+ID4gKyAgICAgICAgICAgICBsaXN0X2FkZCgmY3BhZ2UtPmxpbmssICZ0dm1jLT5t
ZWFzdXJlZF9wYWdlcyk7Cj4gPiArCj4gPiArICAgICAgICAgICAgIG1yLT51c2Vyc3BhY2VfYWRk
ciArPSBQQUdFX1NJWkU7Cj4gPiArICAgICAgICAgICAgIG1yLT5ncGEgKz0gUEFHRV9TSVpFOwo+
ID4gKyAgICAgICAgICAgICBudW1fcGFnZXMtLTsKPiA+ICsgICAgICAgICAgICAgY29uZl9wYWdl
ID0gTlVMTDsKPiA+ICsKPiA+ICsgICAgICAgICAgICAgY29udGludWU7Cj4gPiArICAgICB9Cj4g
PiArICAgICBzcmN1X3JlYWRfdW5sb2NrKCZrdm0tPnNyY3UsIGlkeCk7Cj4gPiArCj4gPiArICAg
ICBpZiAocmMgPCAwKSB7Cj4gPiArICAgICAgICAgICAgIC8qIFdlIGRvbid0IHRvIG5lZWQgdW5w
aW4gcGFnZXMgYXMgaXQgaXMgYWxsb2NhdGVkIGJ5IHRoZSBoeXBlcnZpc29yIGl0c2VsZiAqLwo+
Cj4gVGhpcyBjb21tZW50IG1ha2VzIG5vIHNlbnNlLiAgVGhlIGFib3ZlIGNvZGUgaXMgZG9pbmcg
YWxsIG9mIHRoZSBhbGxvY2F0aW9uIGFuZAo+IHBpbm5pbmcsIHdoaWNoIHN0cm9uZ2x5IHN1Z2dl
c3RzIHRoYXQgS1ZNIGlzIHRoZSBoeXBlcnZpc29yLiAgQnV0IHRoaXMgY29tbWVudAo+IGltcGxp
ZXMgdGhhdCBLVk0gaXMgbm90IHRoZSBoeXBlcnZpc29yLgo+CgpJIG1lYW4gdG8gc2F5IGhlcmUg
dGhlIGNvbmZfcGFnZSBpcyBhbGxvY2F0ZWQgaW4gdGhlIGtlcm5lbCB1c2luZwphbGxvY19wYWdl
LiBTbyBubyBwaW5uaW5nL3VucGlubmluZyBpcyByZXF1aXJlZC4KSXQgc2VlbXMgdGhlIGNvbW1l
bnQgaXMgcHJvYmFibHkgbWlzbGVhZGluZyAmIGNvbmZ1c2luZyBhdCBiZXN0LiBJCndpbGwgcmVt
b3ZlIGl0LgoKPiBBbmQgInBpbm5lZF9wYWdlIiBpcyBjbGVhcmVkIHVucGlubmVkIGluIHRoZSBs
b29wIGFmdGVyIHRoZSBwYWdlIGlzIGFkZGVkK21lYXN1cmVkLAo+IHdoaWNoIGxvb2tzIHRvIGJl
IHRoZSBzYW1lIG1vZGVsIGFzIFREWCB3aGVyZSAicGlubmVkX3BhZ2UiIGlzIHRoZSBzb3VyY2Ug
YW5kCj4gImNvbmZfcGFnZSIgaXMgZ2lmdGVkIHRvIHRoZSBoeXBlcnZpc29yLiAgQnV0IG9uIGZh
aWx1cmUsIGUuZy4gd2hlbiBhbGxvY2F0aW5nCj4gImNvbmZfcGFnZSIsIHRoYXQgcmVmZXJlbmNl
IGlzIG5vdCBwdXQuCj4KClRoYW5rcy4gV2lsbCBmaXggaXQuCgo+ID4gKyAgICAgICAgICAgICBj
b3ZlX2RlbGV0ZV9wYWdlX2xpc3Qoa3ZtLCAmdHZtYy0+bWVhc3VyZWRfcGFnZXMsIGZhbHNlKTsK
PiA+ICsgICAgICAgICAgICAgLyogRnJlZSB0aGUgbGFzdCBhbGxvY2F0ZWQgcGFnZSBmb3Igd2hp
Y2ggY29udmVyc2lvbi9tZWFzdXJlbWVudCBmYWlsZWQgKi8KPiA+ICsgICAgICAgICAgICAga2Zy
ZWUoY29uZl9wYWdlKTsKPgo+IEFzc3VtaW5nIG15IGd1ZXNzZXMgYWJvdXQgaG93IHRoZSBhcmNo
aXRlY3R1cmUgd29ya3MgYXJlIGNvcnJlY3QsIHRoaXMgaXMgYnJva2VuCj4gaWYgc2JpX2Nvdmhf
YWRkX21lYXN1cmVkX3BhZ2VzKCkgZmFpbHMuIFRoZSBwYWdlIGhhcyBhbHJlYWR5IGJlZW4gZ2lm
dGVkIHRvIHRoZQoKWWVhaC4gVGhlIGxhc3QgY29uZl9wYWdlIHNob3VsZCBiZSByZWNsYWltZWQg
YXMgd2VsbCBpZiBtZWFzdXJlZF9wYWdlcwpmYWlsIGF0IGFueSBwb2ludCBpbiB0aGUgbG9vcC4K
QWxsIG90aGVyIGFsbG9jYXRlZCBvbmVzIHdvdWxkIGJlIHJlY2xhaW1lZCBhcyBhIHBhcnQgb2Yg
Y292ZV9kZWxldGVfcGFnZV9saXN0LgoKCgo+IFRTTSBieSBjb3ZlX2NvbnZlcnRfcGFnZXMoKSwg
YnV0IHRoZXJlIGlzIG5vIGNhbGwgdG8gc2JpX2NvdmhfdHNtX3JlY2xhaW1fcGFnZXMoKSwKPiB3
aGljaCBJJ20gZ3Vlc3NpbmcgaXMgbmVjZXNhcnkgdG8gdHJhbnNpdGlvbiB0aGUgcGFnZSBiYWNr
IHRvIGEgc3RhdGUgd2hlcmUgaXQgY2FuCj4gYmUgc2FmZWx5IHVzZWQgYnkgdGhlIGhvc3QuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
