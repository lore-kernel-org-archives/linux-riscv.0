Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80EF8C54E58
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 01:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6UNgg4ZZBuIdcF5FNjbI2vRHClzt5EmDfvuWCG3tSO4=; b=3Ge/rkJGeEK5+i
	2hZleJR7rmD86Rht5YhGVuN6q0xAEQOYCBt3OgJrRs30nbzZR99FwQBPHOIRK5vnTnaDkQYr5pK87
	70OBD4o6PO7c9qOdp2rng9CP5xPU5dcjHZfENSyLt5fF5uhR++JbvLZdYLgRD2OeqF2aX51fioonB
	q2MCD1MASbRxJ3lhoxGcUrYPsnRpiTj+k8ZgrdoAni/R+zK/E5RRFotJtLN4ET1hS9Wl7Kzsmq9vx
	Lz14dUfJMlG9rkmzoA8yDp2gU3n1VbEMVHKp6gx9bE+vacb57oz4F4bqFlWPAZzQa5XB+XGnrt0w5
	GHrFfRsb7YFlRz4uDJ+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjrJS-00000003tFg-30u4;
	Tue, 12 Mar 2024 01:52:18 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjrJO-00000003tCu-0DCY
	for linux-riscv@lists.infradead.org;
	Tue, 12 Mar 2024 01:52:15 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-6e519d73850so2511286a34.2
        for <linux-riscv@lists.infradead.org>; Mon, 11 Mar 2024 18:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1710208330; x=1710813130; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PUDWC2eUrOZ8C2ynRVAXHz0uE0sUzoNBRorpvOY+r94=;
        b=S3xzY8n+dUXOQBsixMs+eQqEG2yhiSH+/rplpS6iA5bEG3a7a55vA4EfB51irzdumr
         JnqTEAlqQP5S6yvLKhz1L9BnqmkaOpBfksRrkgbk2kUErU2am9B9rYEXbUvOs5dobBrO
         ykQ9NEG3T4lTu1AkEaAMw9OO3UV8Olnze2weH6HJcdbIvZLtWsaKOko2F//xz+QX0YCy
         cxVOITjwX3/QU1VZrv+I6yqAalgSexZUx5/1iRb7fnoZSzFOf0RQhufkN+jQPPC4IR67
         ZW4ynOVP1yAa0WD81ptvGpFe2TfVS43LE1ReDp7IJMmGUqxYCBOAHSPfjBqw4bX0UQdf
         qwmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710208330; x=1710813130;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PUDWC2eUrOZ8C2ynRVAXHz0uE0sUzoNBRorpvOY+r94=;
        b=JwArZ8+TEPmD830eYXh1XqyYewIhgJXeYu0FD5NJFM5HY/dxWdgkP6yofRR6zGKMlb
         CX6PK92gBIodI5/qRj4gzcXeeTpSza9+lPI7cRBkGp/d8EBHODvP0gExlnIo9L6upUO3
         ytc+MxAplokNtD9BpQiB9IrwVCzu7YwhSIKqM+i1K3+Ybi55wdgiBMb/l0TmnWrbDW0x
         vmDb9eBHiInvPfY9lFn794WezjLJRuL+TD9vECsvUAfHGgr74spZYXQQ4k+3ZV6h8Ohh
         aH/AIAN2+C2mligVd24H4izMSUKyBcjEGUhsZvuI1NuNaVQWNtiIn0RQmP//I397L4Q0
         tsIw==
X-Forwarded-Encrypted: i=1; AJvYcCVt0xxdAOYv62NAFi3fXWpye6r5cKyTC6jjmYtfEH/XxDCTPq2VWfnWNiwrOSTpS4GnuWyVTsBsU+ImAK4ArAO584CKKsW/IDqFCLi0bTGG
X-Gm-Message-State: AOJu0Yy1VzxvMP5zNfhZyfa1Qj9UN0Q1CAlPoRh/ZdB7UsWsR+IcUL2a
	TVEjigyjDDi3APDMx7LFgvkkXcK7e0SPddvbDmN16WbOJMd8WJom7QmP0PjeeKT23txLosv9SqC
	dby231bLlhN6fT6Hx0vOj1Koc4Mb06l7Of8c7tJ7peeeHHXBGQIe0Pw==
X-Google-Smtp-Source: AGHT+IEw/i3iZ/moT3hoOqVkA0QyZhJITAge4gritgZJGaa4ZUoskcP4axQtqW/tHQZK40PRLKgUppucovxI/Ur0GZ0=
X-Received: by 2002:a05:6870:d182:b0:220:f92f:5bf7 with SMTP id
 a2-20020a056870d18200b00220f92f5bf7mr8145573oac.50.1710208329733; Mon, 11 Mar
 2024 18:52:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240229232211.161961-1-samuel.holland@sifive.com>
 <20240229232211.161961-9-samuel.holland@sifive.com> <CAEEQ3w=8dVxO=qtW6_-SChLJ5No+7nGgf+1fXz0wSeBhb0Kk0A@mail.gmail.com>
 <100d5414-11fa-4c47-9c35-51f5fad2d6e6@sifive.com>
In-Reply-To: <100d5414-11fa-4c47-9c35-51f5fad2d6e6@sifive.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Tue, 12 Mar 2024 09:51:58 +0800
Message-ID: <CAEEQ3wkosTxGowYj5oD4WE7-CvZJS2ui8T5mzoGXp4zSRTf-2w@mail.gmail.com>
Subject: Re: [External] [PATCH v5 08/13] riscv: Avoid TLB flush loops when
 affected by SiFive CIP-1200
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Jisheng Zhang <jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240311_185214_119381_84019123 
X-CRM114-Status: GOOD (  34.38  )
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

SCBTYW11ZWwsCgpPbiBUdWUsIE1hciAxMiwgMjAyNCBhdCA4OjM24oCvQU0gU2FtdWVsIEhvbGxh
bmQKPHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gSGkgWXVuaHVpLAo+Cj4g
T24gMjAyNC0wMi0yOSA4OjQ4IFBNLCB5dW5odWkgY3VpIHdyb3RlOgo+ID4gSGkgU2FtdWVsLAo+
ID4KPiA+IE9uIEZyaSwgTWFyIDEsIDIwMjQgYXQgNzoyMuKAr0FNIFNhbXVlbCBIb2xsYW5kIDxz
YW11ZWwuaG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPiA+Pgo+ID4+IFNpbmNlIGltcGxlbWVu
dGF0aW9ucyBhZmZlY3RlZCBieSBTaUZpdmUgZXJyYXRhIENJUC0xMjAwIGFsd2F5cyB1c2UgdGhl
Cj4gPj4gZ2xvYmFsIHZhcmlhbnQgb2YgdGhlIHNmZW5jZS52bWEgaW5zdHJ1Y3Rpb24sIHRoZXkg
b25seSBuZWVkIHRvIGV4ZWN1dGUKPiA+PiB0aGUgaW5zdHJ1Y3Rpb24gb25jZS4gVGhlIHJhbmdl
LWJhc2VkIGxvb3Agb25seSBodXJ0cyBwZXJmb3JtYW5jZS4KPiA+Pgo+ID4+IFNpZ25lZC1vZmYt
Ynk6IFNhbXVlbCBIb2xsYW5kIDxzYW11ZWwuaG9sbGFuZEBzaWZpdmUuY29tPgo+ID4+IC0tLQo+
ID4+Cj4gPj4gKG5vIGNoYW5nZXMgc2luY2UgdjQpCj4gPj4KPiA+PiBDaGFuZ2VzIGluIHY0Ogo+
ID4+ICAtIE9ubHkgc2V0IHRsYl9mbHVzaF9hbGxfdGhyZXNob2xkIHdoZW4gQ09ORklHX01NVT15
Lgo+ID4+Cj4gPj4gQ2hhbmdlcyBpbiB2MzoKPiA+PiAgLSBOZXcgcGF0Y2ggZm9yIHYzCj4gPj4K
PiA+PiAgYXJjaC9yaXNjdi9lcnJhdGEvc2lmaXZlL2VycmF0YS5jIHwgNSArKysrKwo+ID4+ICBh
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3RsYmZsdXNoLmggfCAyICsrCj4gPj4gIGFyY2gvcmlzY3Yv
bW0vdGxiZmx1c2guYyAgICAgICAgICB8IDIgKy0KPiA+PiAgMyBmaWxlcyBjaGFuZ2VkLCA4IGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+Pgo+ID4+IGRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L2VycmF0YS9zaWZpdmUvZXJyYXRhLmMgYi9hcmNoL3Jpc2N2L2VycmF0YS9zaWZpdmUvZXJy
YXRhLmMKPiA+PiBpbmRleCAzZDlhMzJkNzkxZjcuLjcxNmNmZWRhZDNhMiAxMDA2NDQKPiA+PiAt
LS0gYS9hcmNoL3Jpc2N2L2VycmF0YS9zaWZpdmUvZXJyYXRhLmMKPiA+PiArKysgYi9hcmNoL3Jp
c2N2L2VycmF0YS9zaWZpdmUvZXJyYXRhLmMKPiA+PiBAQCAtNDIsNiArNDIsMTEgQEAgc3RhdGlj
IGJvb2wgZXJyYXRhX2NpcF8xMjAwX2NoZWNrX2Z1bmModW5zaWduZWQgbG9uZyAgYXJjaF9pZCwg
dW5zaWduZWQgbG9uZyBpbXAKPiA+PiAgICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwo+ID4+
ICAgICAgICAgaWYgKChpbXBpZCAmIDB4ZmZmZmZmKSA+IDB4MjAwNjMwIHx8IGltcGlkID09IDB4
MTIwMDYyNikKPiA+PiAgICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwo+ID4+ICsKPiA+PiAr
I2lmZGVmIENPTkZJR19NTVUKPiA+PiArICAgICAgIHRsYl9mbHVzaF9hbGxfdGhyZXNob2xkID0g
MDsKPiA+PiArI2VuZGlmCj4gPj4gKwo+ID4+ICAgICAgICAgcmV0dXJuIHRydWU7Cj4gPj4gIH0K
PiA+Pgo+ID4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3RsYmZsdXNoLmgg
Yi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3RsYmZsdXNoLmgKPiA+PiBpbmRleCA0NjNiNjE1ZDc3
MjguLjhlMzI5NzIxMzc1YiAxMDA2NDQKPiA+PiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L3RsYmZsdXNoLmgKPiA+PiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3RsYmZsdXNoLmgK
PiA+PiBAQCAtNjYsNiArNjYsOCBAQCB2b2lkIGFyY2hfdGxiYmF0Y2hfYWRkX3BlbmRpbmcoc3Ry
dWN0IGFyY2hfdGxiZmx1c2hfdW5tYXBfYmF0Y2ggKmJhdGNoLAo+ID4+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIHVhZGRyKTsKPiA+PiAgdm9pZCBhcmNoX2Zs
dXNoX3RsYl9iYXRjaGVkX3BlbmRpbmcoc3RydWN0IG1tX3N0cnVjdCAqbW0pOwo+ID4+ICB2b2lk
IGFyY2hfdGxiYmF0Y2hfZmx1c2goc3RydWN0IGFyY2hfdGxiZmx1c2hfdW5tYXBfYmF0Y2ggKmJh
dGNoKTsKPiA+PiArCj4gPj4gK2V4dGVybiB1bnNpZ25lZCBsb25nIHRsYl9mbHVzaF9hbGxfdGhy
ZXNob2xkOwo+ID4+ICAjZWxzZSAvKiBDT05GSUdfTU1VICovCj4gPj4gICNkZWZpbmUgbG9jYWxf
Zmx1c2hfdGxiX2FsbCgpICAgICAgICAgICAgICAgICAgZG8geyB9IHdoaWxlICgwKQo+ID4+ICAj
ZW5kaWYgLyogQ09ORklHX01NVSAqLwo+ID4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L21tL3Rs
YmZsdXNoLmMgYi9hcmNoL3Jpc2N2L21tL3RsYmZsdXNoLmMKPiA+PiBpbmRleCAzNjVlMGEwZTQ3
MjUuLjIyODcwZjIxMzE4OCAxMDA2NDQKPiA+PiAtLS0gYS9hcmNoL3Jpc2N2L21tL3RsYmZsdXNo
LmMKPiA+PiArKysgYi9hcmNoL3Jpc2N2L21tL3RsYmZsdXNoLmMKPiA+PiBAQCAtMTEsNyArMTEs
NyBAQAo+ID4+ICAgKiBGbHVzaCBlbnRpcmUgVExCIGlmIG51bWJlciBvZiBlbnRyaWVzIHRvIGJl
IGZsdXNoZWQgaXMgZ3JlYXRlcgo+ID4+ICAgKiB0aGFuIHRoZSB0aHJlc2hvbGQgYmVsb3cuCj4g
Pj4gICAqLwo+ID4+IC1zdGF0aWMgdW5zaWduZWQgbG9uZyB0bGJfZmx1c2hfYWxsX3RocmVzaG9s
ZCBfX3JlYWRfbW9zdGx5ID0gNjQ7Cj4gPj4gK3Vuc2lnbmVkIGxvbmcgdGxiX2ZsdXNoX2FsbF90
aHJlc2hvbGQgX19yZWFkX21vc3RseSA9IDY0Owo+ID4+Cj4gPj4gIHN0YXRpYyB2b2lkIGxvY2Fs
X2ZsdXNoX3RsYl9yYW5nZV90aHJlc2hvbGRfYXNpZCh1bnNpZ25lZCBsb25nIHN0YXJ0LAo+ID4+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25l
ZCBsb25nIHNpemUsCj4gPj4gLS0KPiA+PiAyLjQzLjEKPiA+Pgo+ID4KPiA+IElmIGxvY2FsX2Zs
dXNoX3RsYl9hbGxfYXNpZCgpIGlzIHVzZWQgZXZlcnkgdGltZSwgbW9yZSBQVFdzIHdpbGwgYmUK
PiA+IGdlbmVyYXRlZC4gV2lsbCBzdWNoIG1vZGlmaWNhdGlvbnMgZGVmaW5pdGVseSBpbXByb3Zl
IHRoZSBvdmVyYWxsCj4gPiBwZXJmb3JtYW5jZT8KPgo+IFRoaXMgY2hhbmdlIGluIHRoaXMgY29t
bWl0IHNwZWNpZmljYWxseSBhcHBsaWVzIHRvIG9sZGVyIFNpRml2ZSBTb0NzIHdpdGggYSBidWcK
PiBtYWtpbmcgc2luZ2xlLXBhZ2Ugc2ZlbmNlLnZtYSBpbnN0cnVjdGlvbnMgdW5zYWZlIHRvIHVz
ZS4gSW4gdGhpcyBjYXNlLCBhIHNpbmdsZQo+IGNhbGwgdG8gbG9jYWxfZmx1c2hfdGxiX2FsbF9h
c2lkKCkgaXMgb3B0aW1hbCwgeWVzLgpXb3VsZCBpdCBiZSBtb3JlIGNsZWFyIHRvIGFkZCB0aGlz
IGNvbnRlbnQgdG8gdGhlIGdpdCBjb21taXQKZGVzY3JpcHRpb24gYXBwcm9wcmlhdGVseT8KCj4K
PiA+IEhpIEFsZXgsIFNhbXVlbCwKPiA+IFRoZSByZWxhdGlvbnNoaXAgYmV0d2VlbiBmbHVzaF94
eF9yYW5nZV9hc2lkKCkgYW5kIG5yX3B0ZXMgaXMKPiA+IGJhc2ljYWxseSBsaW5lYXIgZ3Jvd3Ro
ICh5PWt4ICtiKSwgd2hpbGUgZmx1c2hfYWxsX2FzaWQoKSBoYXMgbm90aGluZwo+ID4gdG8gZG8g
d2l0aCBucl9wdGVzICh5PWMpLgo+ID4gU29tZSBUTEJzIG1heSBkbyBzb21lIG9wdGltaXphdGlv
bi4gVGhlIG9wZXJhdGlvbiBvZiBmbHVzaCBhbGwgaXRzZWxmCj4gPiByZXF1aXJlcyB2ZXJ5IGZl
dyBjeWNsZXMsIGJ1dCB0aGVyZSBpcyBhIGNlcnRhaW4gZGVsYXkgYmV0d2Vlbgo+ID4gY29uc2Vj
dXRpdmUgZmx1c2ggYWxsLgo+ID4gVGhlIGludGVyc2VjdGlvbiBvZiB0aGUgdHdvIHN0cmFpZ2h0
IGxpbmVzIGlzIHRoZSBvcHRpbWFsIHNvbHV0aW9uIG9mCj4gPiB0bGJfZmx1c2hfYWxsX3RocmVz
aG9sZC4gSW4gYWN0dWFsIHNpdHVhdGlvbnMsIGNvbnRpbnVvdXMKPiA+IGZsdXNoX2FsbF9hc2lk
IHdpbGwgbm90IG9jY3VyLiBPbmUgcHJvYmxlbSBjYXVzZWQgYnkgZmx1c2hfYWxsX2FzaWQoKQo+
ID4gaXMgdGhhdCBtdWx0aXBsZSBmbHVzaCBlbnRyaWVzIHJlcXVpcmUgUFRXLCB3aGljaCBjYXVz
ZXMgZ3JlYXRlcgo+ID4gbGF0ZW5jeS4KPiA+IFRoZXJlZm9yZSwgdGhlIHZhbHVlIG9mIHRsYl9m
bHVzaF9hbGxfdGhyZXNob2xkIG5lZWRzIHRvIGJlIGNvbnNpZGVyZWQKPiA+IG9yIHF1YW50aWZp
ZWQuIE1heWJlIGRvaW5nIGxvY2FsX2ZsdXNoX3RsYl9wYWdlX2FzaWQoKSBiYXNlZCBvbiB0aGUK
PiA+IGFjdHVhbCBucl9wdGVzX2luX3JhbmdlIHdvdWxkIGdpdmUgYmV0dGVyIG92ZXJhbGwgcGVy
Zm9ybWFuY2UuCj4gPiBXaGF0IGRvIHlvdSB0aGluaz8KPgo+IFllcywgdGhpcyB3YXMgc29tZXRo
aW5nIEFsZXggYnJvdWdodCB1cCB3aGVuIGFkZGluZyB0aGlzIHRocmVzaG9sZCwgdGhhdCBpdAo+
IHNob3VsZCBiZSB0dW5lZCBmb3IgdmFyaW91cyBzY2VuYXJpb3MuIFRoYXQgc3RpbGwgbmVlZHMg
dG8gYmUgZG9uZS4gVGhpcyBwYXRjaAo+IGp1c3QgY292ZXJzIG9uZSBzcGVjaWZpYyBjYXNlIHdo
ZXJlIHdlIGtub3cgdGhlIG9wdGltYWwgYW5zd2VyIGR1ZSB0byBhbiBlcnJhdHVtLgo+Cj4gUmVn
YXJkcywKPiBTYW11ZWwKPgoKVGhhbmtzLApZdW5odWkKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
