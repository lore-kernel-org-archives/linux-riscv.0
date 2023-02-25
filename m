Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65E24C64EC7
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Feb 2023 19:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YVWRm48q1Xm35A/arMZppQHdsd7hpuPF6sorPeDLCaE=; b=ZM60R0i+0UOoWw
	+Ltem4uZxpf8n3S9jUIrQIGa64e9wVBzWqjqCC/h+DsvNr0tUYgq3xguP+BG1kOhDCTbt3J5afLJq
	DTIH7oNbb8F5BOEqzJjL4Vs0yzboLjNaL7VQ9aZ2HjDRRyLWggSa1CnwwQ9UwhnOz6Va/o0gVCfrl
	apoeubBYG95vtpU4aAnyBrGDUhzqogicD92oqvjzaamgxTojxEKGiiKDGV5fuN76JM7Xcj/SCam1N
	tTAMAEU5bfacrX+TH4no4WR1BwCphaEnKnXp9sawU/bJ9MGgPFf07DbfNRUzOaETxPoqBRdbmrD3/
	tpiVvQWKEwJgslFSJpQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pW0EO-006D4u-Ju; Sat, 25 Feb 2023 19:29:17 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pW0EL-006D4F-0f
	for linux-riscv@lists.infradead.org; Sat, 25 Feb 2023 19:29:14 +0000
Received: by mail-ed1-x530.google.com with SMTP id s26so10136627edw.11
        for <linux-riscv@lists.infradead.org>; Sat, 25 Feb 2023 11:29:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=edVifE6bSwZq5HJRu0gexANKAFLl3RFtj1sINE9szoM=;
        b=XsQy/gRPHKewpwRluZoF+tgjeCmf4qznip97bWDbVY33C/f9fOQ42OOdkF+yNFIX4O
         lqBFMuI6cfHvcISzYJiBmQROAX7GLvGv/oJvXNXwJEAMCzQh/yP1UF+mFoitMlraD6yj
         sVnWPabWA8oAbRApUmbfjK1LbEQJbXSP/7ysMZMiLPlSSsD4ctxbE1lnYIqVm7ESgsM3
         FNrAvR7grRgkjUKZMwKHThWBix2nt0a7LfuiwSBE1WZc4iYcp2bzKfxA+2PSXH90B/Il
         mq/OqEnKigcYiVpEozetkZ5KgZI3RZnYpmLPp61XceLnlyNXnPFXjfliv43+9Pz3Cz7U
         eDuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=edVifE6bSwZq5HJRu0gexANKAFLl3RFtj1sINE9szoM=;
        b=AuLPzaKbD8aY1uz8vUCDE8gauxe0hhkEoKIQV0ZcDZ7vIFjwN5w423jpSyDMffW9pX
         a/2rBeVEvnTg/bhkKe2drB6jLeLHzzFkXKlA+5OY6J4ANZp8KLI7hAHyUjrfy7Vcxw21
         Bx1TIvkDmb8rkYuRjylZ8K46AM8hBc62dj2TZakeOR0ZJ9PX+HRq0dNtmennkkljAGEW
         TS9PARw+lt7k9CkkyMRjS3DfEZwjEAaQLu69i/gXCOczbkxXECRH8KlH9xissOgP+CQ8
         KbELmD4iB+98LytmFcNnHoj8mWXHE4GKHO4XBoJdOCeYeMXaPekmorTgDaSrSV27HPUq
         +EhQ==
X-Gm-Message-State: AO0yUKUFIRp0hezFfbfvTMurjEAUGCE+d8W2q/gPAQjFhEb0I2Xnu2KN
	/OyJFzenHlH2X8HBdw77JWg=
X-Google-Smtp-Source: AK7set/C+pOecxKEb98MuHPxnPZvOk6mZjNvB/uZI4I3oztA2jR9QQ1406E81QyYMk7lhd+MUVtK7w==
X-Received: by 2002:a17:906:4550:b0:8b1:7ae8:ba79 with SMTP id s16-20020a170906455000b008b17ae8ba79mr30322125ejq.30.1677353349851;
        Sat, 25 Feb 2023 11:29:09 -0800 (PST)
Received: from curiosity ([80.211.22.60])
        by smtp.gmail.com with ESMTPSA id o15-20020a1709064f8f00b008b17662e1f7sm1134303eju.53.2023.02.25.11.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Feb 2023 11:29:08 -0800 (PST)
Date: Sat, 25 Feb 2023 22:29:04 +0300
From: Sergey Matyukevich <geomatsi@gmail.com>
To: Zong Li <zongbox@gmail.com>, Guo Ren <guoren@linux.alibaba.com>,
	guoren@kernel.org
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, guoren@kernel.org,
	anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	conor.dooley@microchip.com, heiko@sntech.de,
	philipp.tomsich@vrull.eu, alex@ghiti.fr, hch@lst.de,
	ajones@ventanamicro.com, gary@garyguo.net, jszhang@kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Palmer Dabbelt <palmer@rivosinc.com>, Zong Li <zong.li@sifive.com>
Subject: Re: [PATCH V3] riscv: asid: Fixup stale TLB entry cause application
 crash
Message-ID: <Y/phgGFWMf/4WRSS@curiosity>
References: <20221111075902.798571-1-guoren@kernel.org>
 <CA+V-a8tbFhefuYF0UrGNrKZn6CpHEUhOvsf4GNmdLza0gWvf=w@mail.gmail.com>
 <CA+ZOyah9dBzzkHyy6wxk+hok3K1YrR9h+VdA3aTW5+m9ne04SQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+ZOyah9dBzzkHyy6wxk+hok3K1YrR9h+VdA3aTW5+m9ne04SQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230225_112913_081055_02E94937 
X-CRM114-Status: GOOD (  42.99  )
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

T24gRnJpLCBGZWIgMjQsIDIwMjMgYXQgMDE6NTc6NTVBTSArMDgwMCwgWm9uZyBMaSB3cm90ZToK
PiBMYWQsIFByYWJoYWthciA8cHJhYmhha2FyLmNzZW5nZ0BnbWFpbC5jb20+IOaWvCAyMDIy5bm0
MTLmnIgyM+aXpSDpgLHkupQg5LiL5Y2IODo1NOWvq+mBk++8mgo+ID4KPiA+IEhpIEd1bywKPiA+
Cj4gPiBUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4KPiA+Cj4gPiBPbiBGcmksIE5vdiAxMSwgMjAy
MiBhdCA4OjAwIEFNIDxndW9yZW5Aa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+Cj4gPiA+IEZyb206
IEd1byBSZW4gPGd1b3JlbkBsaW51eC5hbGliYWJhLmNvbT4KPiA+ID4KPiA+ID4gQWZ0ZXIgdXNl
X2FzaWRfYWxsb2NhdG9yIGlzIGVuYWJsZWQsIHRoZSB1c2Vyc3BhY2UgYXBwbGljYXRpb24gd2ls
bAo+ID4gPiBjcmFzaCBieSBzdGFsZSBUTEIgZW50cmllcy4gQmVjYXVzZSBvbmx5IHVzaW5nIGNw
dW1hc2tfY2xlYXJfY3B1IHdpdGhvdXQKPiA+ID4gbG9jYWxfZmx1c2hfdGxiX2FsbCBjb3VsZG4n
dCBndWFyYW50ZWUgQ1BVJ3MgVExCIGVudHJpZXMgd2VyZSBmcmVzaC4KPiA+ID4gVGhlbiBzZXRf
bW1fYXNpZCB3b3VsZCBjYXVzZSB0aGUgdXNlciBzcGFjZSBhcHBsaWNhdGlvbiB0byBnZXQgYSBz
dGFsZQo+ID4gPiB2YWx1ZSBieSBzdGFsZSBUTEIgZW50cnksIGJ1dCBzZXRfbW1fbm9hc2lkIGlz
IG9rYXkuCj4gPiA+Cj4gPiA+IEhlcmUgaXMgdGhlIHN5bXB0b20gb2YgdGhlIGJ1ZzoKPiA+ID4g
dW5oYW5kbGVkIHNpZ25hbCAxMSBjb2RlIDB4MSAoY29yZWR1bXApCj4gPiA+ICAgIDB4MDAwMDAw
M2ZkNmQyMjUyNCA8KzQ+OiAgICAgYXVpcGMgICBzMCwweDcwCj4gPiA+ICAgIDB4MDAwMDAwM2Zk
NmQyMjUyOCA8Kzg+OiAgICAgbGQgICAgICBzMCwtMTQ4KHMwKSAjIDB4M2ZkNmQ5MjQ5MAo+ID4g
PiA9PiAweDAwMDAwMDNmZDZkMjI1MmMgPCsxMj46ICAgIGxkICAgICAgYTUsMChzMCkKPiA+ID4g
KGdkYikgaSByIHMwCj4gPiA+IHMwICAgICAgICAgIDB4ODA4MmVkMWNjMzE5OGIyMSAgICAgICAw
eDgwODJlZDFjYzMxOThiMjEKPiA+ID4gKGdkYikgeCAvMnggMHgzZmQ2ZDkyNDkwCj4gPiA+IDB4
M2ZkNmQ5MjQ5MDogICAweGQ4MGFjOGE4ICAgICAgMHgwMDAwMDAzZgo+ID4gPiBUaGUgY29yZSBk
dW1wIGZpbGUgc2hvd3MgdGhhdCByZWdpc3RlciBzMCBpcyB3cm9uZywgYnV0IHRoZSB2YWx1ZSBp
bgo+ID4gPiBtZW1vcnkgaXMgY29ycmVjdC4gQmVjYXVzZSAnbGQgczAsIC0xNDgoczApJyB1c2Vk
IGEgc3RhbGUgbWFwcGluZyBlbnRyeQo+ID4gPiBpbiBUTEIgYW5kIGdvdCBhIHdyb25nIHJlc3Vs
dCBmcm9tIGFuIGluY29ycmVjdCBwaHlzaWNhbCBhZGRyZXNzLgo+ID4gPgo+ID4gPiBXaGVuIHRo
ZSB0YXNrIHJhbiBvbiBDUFUwLCB3aGljaCBsb2FkZWQvc3BlY3VsYXRpdmUtbG9hZGVkIHRoZSB2
YWx1ZSBvZgo+ID4gPiBhZGRyZXNzKDB4M2ZkNmQ5MjQ5MCksIHRoZW4gdGhlIGZpcnN0IHZlcnNp
b24gb2YgdGhlIG1hcHBpbmcgZW50cnkgd2FzCj4gPiA+IFBUV2VkIGludG8gQ1BVMCdzIFRMQi4K
PiA+ID4gV2hlbiB0aGUgdGFzayBzd2l0Y2hlZCBmcm9tIENQVTAgdG8gQ1BVMSAoTm8gbG9jYWxf
dGxiX2ZsdXNoX2FsbCBoZXJlIGJ5Cj4gPiA+IGFzaWQpLCBpdCBoYXBwZW5lZCB0byB3cml0ZSBh
IHZhbHVlIG9uIHRoZSBhZGRyZXNzICgweDNmZDZkOTI0OTApLiBJdAo+ID4gPiBjYXVzZWQgZG9f
cGFnZV9mYXVsdCAtPiB3cF9wYWdlX2NvcHkgLT4gcHRlcF9jbGVhcl9mbHVzaCAtPgo+ID4gPiBw
dGVwX2dldF9hbmRfY2xlYXIgJiBmbHVzaF90bGJfcGFnZS4KPiA+ID4gVGhlIGZsdXNoX3RsYl9w
YWdlIHVzZWQgbW1fY3B1bWFzayhtbSkgdG8gZGV0ZXJtaW5lIHdoaWNoIENQVXMgbmVlZCBUTEIK
PiA+ID4gZmx1c2gsIGJ1dCBDUFUwIGhhZCBjbGVhcmVkIHRoZSBDUFUwJ3MgbW1fY3B1bWFzayBp
biB0aGUgcHJldmlvdXMKPiA+ID4gc3dpdGNoX21tLiBTbyB3ZSBvbmx5IGZsdXNoZWQgdGhlIENQ
VTEgVExCIGFuZCBzZXQgdGhlIHNlY29uZCB2ZXJzaW9uCj4gPiA+IG1hcHBpbmcgb2YgdGhlIFBU
RS4gV2hlbiB0aGUgdGFzayBzd2l0Y2hlZCBmcm9tIENQVTEgdG8gQ1BVMCBhZ2FpbiwgQ1BVMAo+
ID4gPiBzdGlsbCB1c2VkIGEgc3RhbGUgVExCIG1hcHBpbmcgZW50cnkgd2hpY2ggY29udGFpbmVk
IGEgd3JvbmcgdGFyZ2V0Cj4gPiA+IHBoeXNpY2FsIGFkZHJlc3MuIEl0IHJhaXNlZCBhIGJ1ZyB3
aGVuIHRoZSB0YXNrIGhhcHBlbmVkIHRvIHJlYWQgdGhhdAo+ID4gPiB2YWx1ZS4KPiA+ID4KPiA+
ID4gICAgQ1BVMCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBDUFUxCj4gPiA+ICAgIC0g
c3dpdGNoICd0YXNrJyBpbgo+ID4gPiAgICAtIHJlYWQgYWRkciAoRmlsbCBzdGFsZSBtYXBwaW5n
Cj4gPiA+ICAgICAgZW50cnkgaW50byBUTEIpCj4gPiA+ICAgIC0gc3dpdGNoICd0YXNrJyBvdXQg
KG5vIHRsYl9mbHVzaCkKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAtIHN3aXRjaCAndGFzaycgaW4gKG5vIHRsYl9mbHVzaCkKPiA+ID4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAtIHdyaXRlIGFkZHIgY2F1c2UgcGFnZWZhdWx0Cj4gPiA+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkb19wYWdlX2ZhdWx0KCkg
KGNoYW5nZSB0bwo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
bmV3IGFkZHIgbWFwcGluZykKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgd3BfcGFnZV9jb3B5KCkKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBwdGVwX2NsZWFyX2ZsdXNoKCkKPiA+ID4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHB0ZXBfZ2V0X2FuZF9jbGVhcigpCj4gPiA+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmIGZsdXNoX3Rs
Yl9wYWdlKCkKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHdy
aXRlIG5ldyB2YWx1ZSBpbnRvIGFkZHIKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAtIHN3aXRjaCAndGFzaycgb3V0IChubyB0bGJfZmx1c2gpCj4gPiA+ICAgIC0g
c3dpdGNoICd0YXNrJyBpbiAobm8gdGxiX2ZsdXNoKQo+ID4gPiAgICAtIHJlYWQgYWRkciBhZ2Fp
biAoVXNlIHN0YWxlCj4gPiA+ICAgICAgbWFwcGluZyBlbnRyeSBpbiBUTEIpCj4gPiA+ICAgICAg
Z2V0IHdyb25nIHZhbHVlIGZyb20gb2xkIHBoeWljYWwKPiA+ID4gICAgICBhZGRyLCBCVUchCj4g
PiA+Cj4gPiA+IFRoZSBzb2x1dGlvbiBpcyB0byBrZWVwIGFsbCBDUFVzJyBmb290bWFya3Mgb2Yg
Y3B1bWFzayhtbSkgaW4gc3dpdGNoX21tLAo+ID4gPiB3aGljaCBjb3VsZCBndWFyYW50ZWUgdG8g
aW52YWxpZGF0ZSBhbGwgc3RhbGUgVExCIGVudHJpZXMgZHVyaW5nIFRMQgo+ID4gPiBmbHVzaC4K
PiA+ID4KPiA+ID4gRml4ZXM6IDY1ZDRiOWM1MzAxNyAoIlJJU0MtVjogSW1wbGVtZW50IEFTSUQg
YWxsb2NhdG9yIikKPiA+ID4gU2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFs
aWJhYmEuY29tPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9y
Zz4KPiA+ID4gQ2M6IEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPgo+ID4gPiBD
YzogUGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+Cj4gPiA+IC0tLQo+ID4gPiBD
aGFuZ2VzIGluIHYzOgo+ID4gPiAgLSBNb3ZlIHNldC9jbGVhciBjcHVtYXNrKG1tKSBpbnRvIHNl
dF9tbSAoTWFrZSBjb2RlIG1vcmUgcHJldHR5Cj4gPiA+ICAgIHdpdGggQW5kcmV3J3MgYWR2aWNl
KQo+ID4gPiAgLSBPcHRpbWl6ZSBjb21tZW50IGRlc2NyaXB0aW9uCj4gPiA+Cj4gPiA+IENoYW5n
ZXMgaW4gdjI6Cj4gPiA+ICAtIEZpeHVwIG5vbW11IGNvbXBpbGUgcHJvYmxlbSAoVGh4IENvbm9y
LCBBbHNvIFJlcG9ydGVkLWJ5OiBrZXJuZWwKPiA+ID4gICAgdGVzdCByb2JvdCA8bGtwQGludGVs
LmNvbT4pCj4gPiA+ICAtIEtlZXAgY3B1bWFza19jbGVhcl9jcHUgZm9yIG5vYXNpZAo+ID4gPiAt
LS0KPiA+ID4gIGFyY2gvcmlzY3YvbW0vY29udGV4dC5jIHwgMzAgKysrKysrKysrKysrKysrKysr
KystLS0tLS0tLS0tCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgMTAg
ZGVsZXRpb25zKC0pCj4gPiA+Cj4gPiBBcyByZXBvcnRlZCBvbiB0aGUgcGF0Y2ggWzBdIEkgd2Fz
IHNlZWluZyBjb25zaXN0ZW50IGZhaWx1cmVzIG9uIHRoZQo+ID4gUlovRml2ZSBTb0Mgd2hpbGUg
cnVubmluZyBib25uaWUrKyB1dGlsaXR5LiBBZnRlciBhcHBseWluZyB0aGlzIHBhdGNoCj4gPiBv
biB0b3Agb2YgUGFsbWVyJ3MgZm9yLW5leHQgYnJhbmNoIChlYjY3ZDIzOWYzYWEpIEkgYW0gbm8g
bG9uZ2VyCj4gPiBzZWVpbmcgdGhpcyBpc3N1ZS4KPiA+Cj4gPiBUZXN0ZWQtYnk6IExhZCBQcmFi
aGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4KPiA+Cj4gPiBb
MF0gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LXJpc2N2L3BhdGNo
LzIwMjIwODI5MjA1MjE5LjI4MzU0My0xLWdlb21hdHNpQGdtYWlsLmNvbS8KPiA+Cj4gCj4gSGkg
YWxsLAo+IEkgZ290IHRoZSBzYW1lIHNpdHVhdGlvbiAoaS5lLiB1bmhhbmRsZSBzaWduYWwgMTEp
IG9uIG91ciBpbnRlcm5hbAo+IG11bHRpLWNvcmUgc3lzdGVtLCBJIHRyaWVkIHRoZSBwYXRjaFsw
XSAmIFsxXSwgYnV0IGl0IHN0aWxsIGRvZXNuJ3QKPiB3b3JrLCBJIGd1ZXNzIHRoZXJlIGFyZSBz
dGlsbCBzb21lIHBvdGVudGlhbCBwcm9ibGVtcy4gQWZ0ZXIgYXBwbHlpbmcKPiB0aGlzIHBhdGNo
LCB0aGUgc2l0dWF0aW9uIGRpc2FwcGVhcmVkLCBJIHRvb2sgc29tZSB0aW1lIHRvIGxvb2sgYXQK
PiBvdGhlciBhcmNoZXMnIGltcGxlbWVudGF0aW9ucywgc3VjaCBhcyBhcmMsIHRoZXkgZG9uJ3Qg
Y2xlYXIgdGhlCj4gbW1fY3B1bWFzayBkdWUgdG8gdGhlIHNpbWlsYXIgaXNzdWUuIEkgY2FuJ3Qg
c2F5IHdoaWNoIGFwcHJvYWNoIG1pZ2h0Cj4gYmUgYmV0dGVyLCBidXQgSSdkIGxpa2UgdG8gcG9p
bnQgb3V0IHRoYXQgdGhpcyBwYXRjaCB3b3JrcyB0byBtZS4KPiBUaGFua3MuCj4gCj4gVGVzdGVk
LWJ5OiBab25nIExpIDx6b25nLmxpQHNpZml2ZS5jb20+Cj4gCj4gWzBdIGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjIwODI5MjA1MjE5LjI4MzU0My0xLWdlb21hdHNpQGdt
YWlsLmNvbS8KPiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvMjAyMzAx
MjkyMTE4MTguNjg2NTU3LTEtZ2VvbWF0c2lAZ21haWwuY29tLwoKVGhhbmtzIGZvciB0aGUgcmVw
b3J0ISBCeSB0aGUgd2F5LCBjb3VsZCB5b3UgcGxlYXNlIHNoYXJlIHNvbWUKaW5mb3JtYXRpb24g
YWJvdXQgdGhlIHJlcHJvZHVjaW5nIHdvcmtsb2FkID8KCkluaXRpYWwgaWRlYSB3YXMgdG8gcmVk
dWNlIHRoZSBudW1iZXIgb2YgVExCIGZsdXNoZXMgYnkgZGVmZXJyaW5nIChhbmQKcG9zc2libHkg
YXZvaWRpbmcpIHNvbWUgb2YgdGhlbS4gQnV0IHdlIGhhdmUgYWxyZWFkeSBidWcgcmVwb3J0cyBm
cm9tCnR3byBkaWZmZXJlbnQgdmVuZG9ycywgc28gYXBwYXJlbnRseSBzb21ldGhpbmcgaXMgb3Zl
cmxvb2tlZCBoZXJlLgpMZXRzIHN3aXRjaCB0byAnYWdncnJlZ2F0aW5nJyBtbV9jcHVtYXNrIGFw
cHJvYWNoIHN1Z2dlc3RlZCBieSBHdW8gUmVuLgoKQEd1byBSZW4sIGRvIHlvdSBtaW5kIGlmIEkg
cmUtc2VuZCB5b3VyIHYzIHBhdGNoIHRvZ2V0aGVyIHdpdGggdGhlCnJlbWFpbmluZyByZXZlcnRz
IG9mIG15IGNoYW5nZXMgPwoKUmVnYXJkcywKU2VyZ2V5CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
