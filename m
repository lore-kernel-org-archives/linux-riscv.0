Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5DF5C43458
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 04:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZnJ8ihMmxNpbkafY018zE3O1sgcBGft1bX8+Ka32KvU=; b=s6oaUuHTt31vZM
	9JkB4xZxlqa88kCx0YzTHBriaMRvcHRz3N82zlg+irul3pb+xqR+P/nHc2iZsn5DKfsh3qYIyxSgG
	cwRLMzASlGx6Quw6ogSn5JDomQrPeaT9yM4Z9za5zc0m59yM1nmRMCi7dsoe16oPBFqTMSIvK8oQZ
	u0h36ug8sc/UE4n3BWxVzMbxfa4hO/mgXmN7GPHfyATMOL8x5rNWt7EtjcEcC9kbe0K0jrvEVPcrU
	IgJI5/HrpvXShY57o1RMLQxLO+4n0oOOjAbp2hgXSogHPiZT6WFhnn25n7QNWr59utUHXb5+IUao1
	AE0hJ+e6+w1Yd6yOF28Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wen2C-00000000euF-3hnW;
	Wed, 01 Jul 2026 04:58:52 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wen29-00000000etS-1wnG
	for linux-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 04:58:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782881928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ijvj3rIROI2FO/mVXn6rz1WJEKmru4R1tDm+SMDG9ms=;
	b=KrH0AeAKE2Cw9/vHJytQh/L6LVC1o7vaGWuukg/XWFQyIyca+m+o5cYHjZp07jn/Sw51/b
	+bHsuJexkzzkPucJHS9uP9miz/nMnMUjzDpda6jv6CkKiZYElGoO9thDMDhYkI6eWl5Lq6
	P7PQe/liVyuRdtP275k7LkqZytJOiSw=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-482-aNPZ40mkP-uZIGYIvSXBQw-1; Wed, 01 Jul 2026 00:58:46 -0400
X-MC-Unique: aNPZ40mkP-uZIGYIvSXBQw-1
X-Mimecast-MFC-AGG-ID: aNPZ40mkP-uZIGYIvSXBQw_1782881926
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bff5c7035so4984771cf.2
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jun 2026 21:58:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782881926; x=1783486726;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ijvj3rIROI2FO/mVXn6rz1WJEKmru4R1tDm+SMDG9ms=;
        b=rRLpcx6EakZ9D0A3GxlbgMcCoA527CZLt0xew8AT6cRBAwiAT3WakJeSbS1kPSyDAY
         SePxELKvQFsMsTI60mdIMLXGcVUrXequ2TQKmDtZ7RDoNsoT0TVEqCSIzmIGnMoXXYSP
         rpoOla+Qk7IcslUV7pNDSZslWt1bMV9O5KclCg4nNQEtnZA8VtIEjDRQEBnrn1XE3Z7x
         w/k3SF1omjL6vwwIHresbIfRm4+X2wkZ/b7/ZJyajcVVMusQNq+sFJnMY648/qcCFFbd
         0Y4/OU2O+fdgHeTjtHkLXIZLWIetAsCJOAdjENKYrYXkToX+DeD+y+9VWYy0sFZa+bon
         1S1Q==
X-Forwarded-Encrypted: i=1; AFNElJ+zxtaobLO5GMgYKdDu3agW7iRqX5IgdeeWGaZLAXlC/hpjGEmDCDgvIqF+LMAcxDD25V0AVBX55k0qoQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzKrob+p/2saK53hcTzZ10+PmTi5rY3mkzc27ALwlZdfw3NE6OH
	Fe1ikKu7ZasCfTdJ+5SBbX+Zt7HgR3N5iLiRYiuBCvHts6VG9ROMhjPC6mjsgGjWfhmh7cTcOXa
	YbT6kRBGP2qPe1vPuXWuud0K8Wz3b5HlHlwZn/Jnq3e98X6Slj2iKeZFELUNJWwgf/ucYOiqo9v
	YrnvSFp+oWUspDUzvORZ3bipKyTdKIdcQOQqxXqBX/mJjk
X-Gm-Gg: AfdE7cn0aB0/IT2jMpf2C/zaghp4jyIh1+J0worbn7+UkApzBzNsVYBVjC1vo07KjWn
	5hdzg906RKJk0uD+2m9y5TrSuu9wiOoZ8DwihQqif4VqoJES6ZSsBW23QrYU2IIkdoIO+WI6gs9
	6RTVcVBU67ootbVsEW6folYB/SbXuYEEyFVPpqXNuMohfZMcDirbjuHHeEau9SrtWj4g==
X-Received: by 2002:a05:622a:5506:b0:517:5f04:f24c with SMTP id d75a77b69052e-51c26b0074emr1885901cf.39.1782881926265;
        Tue, 30 Jun 2026 21:58:46 -0700 (PDT)
X-Received: by 2002:a05:622a:5506:b0:517:5f04:f24c with SMTP id
 d75a77b69052e-51c26b0074emr1885651cf.39.1782881925860; Tue, 30 Jun 2026
 21:58:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260701025732.66330-2-ltao@redhat.com> <akSOb1_1tcJvFyda@kernel.org>
In-Reply-To: <akSOb1_1tcJvFyda@kernel.org>
From: Tao Liu <ltao@redhat.com>
Date: Wed, 1 Jul 2026 16:58:09 +1200
X-Gm-Features: AVVi8CecY3QtyR15biAB9c6BdBCvMEH22nDddc-TMyZfwtXlVx2ChNVQ9i9xRmk
Message-ID: <CAO7dBbVftLUhd2qrh7hmijTB3PEPfZAhykCGqEfrPoOcSrrj-w@mail.gmail.com>
Subject: Re: [PATCH v3] riscv: Fix a NULL pointer dereference in machine_kexec_prepare
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kexec@lists.infradead.org, bhe@redhat.com, zohar@linux.ibm.com, 
	roberto.sassu@huawei.com, dmitry.kasatkin@gmail.com, eric.snowberg@oracle.com, 
	linux-integrity@vger.kernel.org, pratyush@kernel.org, Markus.Elfring@web.de, 
	kernel-janitors@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: snAAwE-j6cNqWIZpAmfJWAWQXm6T0XLTETBPsMrP_7g_1782881926
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_215849_612407_6212E029 
X-CRM114-Status: GOOD (  26.06  )
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

SGkgSmFya2tvLAoKT24gV2VkLCBKdWwgMSwgMjAyNiBhdCAzOjUw4oCvUE0gSmFya2tvIFNha2tp
bmVuIDxqYXJra29Aa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBXZWQsIEp1bCAwMSwgMjAyNiBh
dCAwMjo1NzozM1BNICsxMjAwLCBUYW8gTGl1IHdyb3RlOgo+ID4gQSBOVUxMIHBvaW50ZXIgZGVy
ZWZlcmVuY2UgaXNzdWUgaXMgbm90aWNlZCBpbiByaXNjdidzIG1hY2hpbmVfa2V4ZWNfcHJlcGFy
ZSwKPiA+IHdoZXJlIGltYWdlLT5zZWdtZW50W2ldLmJ1ZiBtaWdodCBiZSBOVUxMIGFuZCBjb3Bp
ZWQgdW5jaGVja2VkLgo+ID4KPiA+IFRoZSBOVUxMIGJ1ZiBjb21lcyBmcm9tIHNlY3VyaXR5L2lu
dGVncml0eS9pbWEvaW1hX2tleGVjLmM6Cj4gPiBpbWFfYWRkX2tleGVjX2J1ZmZlcigpLCB3aGVy
ZSBrYnVmIGlzIGFkZGVkIGJ5IGtleGVjX2FkZF9idWZmZXIoKSwKPiA+IGJ1dCBrYnVmLmJ1ZmZl
ciBpcyBOVUxMCj4KPiBUaGlzIHNob3VsZCBoYXZlIGEgcHJvcGVyIGNhbGwgc2VxdWVuY2UuIE5v
dyB0aGUgcm9vdCBjYXVzZSBpcwo+IG9iZnVzY2F0ZWQuCgpTdXJlLCBJIHdpbGwgYXR0YWNoIHRo
ZSBzdGFjayB0cmFjZSBpbiB2NC4gSGVyZSBpcyB0aGUgb25lOgoKWyAgIDYyLjg2NzU0MF0ga2V4
ZWNfZmlsZShJbWFnZSk6IExvYWRlZCBrZXJuZWwgYXQgMHg4MDIwMDAwMApidWZzej0weDM0ZWQ4
MDAgbWVtc3o9MHgzNWQwMDAwClsgICA2Mi44Nzk5ODNdIFVuYWJsZSB0byBoYW5kbGUga2VybmVs
IGFjY2VzcyB0byB1c2VyIG1lbW9yeSB3aXRob3V0CnVhY2Nlc3Mgcm91dGluZXMgYXQgdmlydHVh
bCBhZGRyZXNzIDAwMDAwMDAwMDAwMDAwMDAKWyAgIDYyLjg4MDczNl0gQ3VycmVudCBrZXhlYyBw
Z3RhYmxlOiA0SyBwYWdlc2l6ZSwgNTctYml0IFZBcywKcGdkcD0weDAwMDAwMDAxMDYyZWIwMDAK
WyAgIDYyLjg4MTE4NV0gWzAwMDAwMDAwMDAwMDAwMDBdIHBnZD0wMDAwMDAwMDQxM2I0NDAxLApw
NGQ9MDAwMDAwMDA0MTUxYmMwMSwgcHVkPTAwMDAwMDAwNDE1Yjc4MDEsIHBtZD0wMDAwMDAwMDQw
YWY1ODAxLApwdGU9MDAwMDAwMDAwMDAwMDAwMApbICAgNjIuODgxOTY5XSBPb3BzIFsjMV0KWyAg
IDYyLjg4MjA3N10gTW9kdWxlcyBsaW5rZWQgaW46ClsgICA2Mi44ODI3MTddIENQVTogMSBVSUQ6
IDAgUElEOiA4OTQgQ29tbToga2V4ZWMgTm90IHRhaW50ZWQgNy4xLjEgIzQKUFJFRU1QVChsYXp5
KQpbICAgNjIuODgzMDM3XSBIYXJkd2FyZSBuYW1lOiBRRU1VIFFFTVUgVmlydHVhbCBNYWNoaW5l
LCBCSU9TCmVkazItMjAyNjA1MDgtMi5mYzQ0IDA1LzA4LzIwMjYKWyAgIDYyLjg4MzM2NV0gZXBj
IDogX19tZW1jcHkrMHhkNC8weGY4ClsgICA2Mi44ODM2ODVdICByYSA6IG1hY2hpbmVfa2V4ZWNf
cHJlcGFyZSsweDhhLzB4Mjk4ClsgICA2Mi44ODM5MTRdIGVwYyA6IGZmZmZmZmZmODEzOTNlZTgg
cmEgOiBmZmZmZmZmZjgwMDM2NmNhIHNwIDoKZmYyMDAwMDAwNGE4M2QxMApbICAgNjIuODg0MjE0
XSAgZ3AgOiBmZmZmZmZmZjgzMjU4ZGI4IHRwIDogZmY2MDAwMDA4NTczZGI4MCB0MCA6CmZmZmZm
ZmZmODAwMzM2NDAKWyAgIDYyLjg4NDQzM10gIHQxIDogMjE1MmZmZmZmZmZmZmZjMCB0MiA6IDAw
MDAwMDAwMDMwMDAwMDAgczAgOgpmZjIwMDAwMDA0YTgzZDgwClsgICA2Mi44ODQ3MTBdICBzMSA6
IDAwMDAwMDAwMDAwMDAwMDAgYTAgOiBmZjIwMDAwMDA0YTgzZDEwIGExIDoKMDAwMDAwMDAwMDAw
MDAwMApbICAgNjIuODg0OTg3XSAgYTIgOiAwMDAwMDAwMDAwMDAwMDI4IGEzIDogMDAwMDAwMDAw
MDAwMDAyOCBhNCA6CjAwMDAwMDAwMDAwMDAwMDAKWyAgIDYyLjg4NTIwOF0gIGE1IDogMDAwMDAw
MDAwMDAwMDAwMCBhNiA6IDAwMDAwMDAxMDRlMzNmZmYgYTcgOgowMDAwMDAwMDAwMDAwMDAwClsg
ICA2Mi44ODU0ODZdICBzMiA6IGZmNjAwMDAwODJhMzU4MDAgczMgOiAwMDAwMDAwMDAwMDAwMDAw
IHM0IDoKMDAwMDAwMDAwMDAwMDAxMApbICAgNjIuODg1Nzc0XSAgczUgOiAwMDAwMDAwMDAwMDAw
MDI4IHM2IDogZmYyMDAwMDAwNGE4M2QxMCBzNyA6CjAwMDAwMDAwMDAwMDAwMDUKWyAgIDYyLjg4
NjAwNV0gIHM4IDogMDAwMDAwMDAwMDAwMDBjMCBzOSA6IDAwMDAwMDAwMGFjMGQyMjAgczEwOgpm
ZmZmZmZmZjgzNTQyMGU4ClsgICA2Mi44ODYyMThdICBzMTE6IDAwMDAwMDAwMDAwMDAwMDAgdDMg
OiBmZmZmZmY4MDAwMDAwMDdjIHQ0IDoKZmYxYzAwMDAwMjEzOGQwMApbICAgNjIuODg2NTE1XSAg
dDUgOiBmZmZmZmZmZmZmZmZmZmZmIHQ2IDogZmYyMDAwMDAwNGE4M2QxMCBzc3AgOgowMDAwMDAw
MDAwMDAwMDAwClsgICA2Mi44ODY4NjBdIHN0YXR1czogMDAwMDAwMDIwMDAwMDEyMCBiYWRhZGRy
OiAwMDAwMDAwMDAwMDAwMDAwCmNhdXNlOiAwMDAwMDAwMDAwMDAwMDBkClsgICA2Mi44ODcxNjJd
IFs8ZmZmZmZmZmY4MTM5M2VlOD5dIF9fbWVtY3B5KzB4ZDQvMHhmOApbICAgNjIuODg3Mzg4XSBb
PGZmZmZmZmZmODAxYjI1M2E+XSBfX2RvX3N5c19rZXhlY19maWxlX2xvYWQrMHgxYjIvMHgzMzgK
WyAgIDYyLjg4NzYxMl0gWzxmZmZmZmZmZjgwMWIyNmU0Pl0gX19yaXNjdl9zeXNfa2V4ZWNfZmls
ZV9sb2FkKzB4MjQvMHg0MApbICAgNjIuODg3ODU1XSBbPGZmZmZmZmZmODEzOTVlYTQ+XSBkb190
cmFwX2VjYWxsX3UrMHgxYTQvMHg1YTgKWyAgIDYyLjg4ODEzNF0gWzxmZmZmZmZmZjgxM2E5ZWVj
Pl0gaGFuZGxlX2V4Y2VwdGlvbisweDE2Yy8weDE3OApbICAgNjIuODg4NDQ1XSBDb2RlOiA3NjEz
IDA3ZjYgY2EwNSA4NmIzIDAwYzUgZTdiMyAwMWY1IDhmZDUgOGI4ZCBlYjg5Cig0MTk4KSAwNTkx
ClsgICA2Mi44ODkyMjNdIC0tLVsgZW5kIHRyYWNlIDAwMDAwMDAwMDAwMDAwMDAgXS0tLQpTZWdt
ZW50YXRpb24gZmF1bHQgICAgICAgICBrZXhlYyAtbCAvYm9vdC92bWxpbnV6LTcuMS4xCi0taW5p
dHJkPS9ib290L2luaXRyYW1mcy03LjEuMS5pbWcgLS1yZXVzZS1jbWRsaW5lCgooZ2RiKSBwIGlt
YWdlLT5zZWdtZW50WzBdCiQzID0ge3tidWYgPSAweDAsIGtidWYgPSAweDB9LCBidWZzeiA9IDAs
IG1lbSA9IDEwNzM3NTg2MTc2LCBtZW1zeiA9IDQwOTZ9CgpUaGUgYnVmID0gMHgwIGFuZCBidWZz
eiA9IDAgY29tZXMgZnJvbSBpbWFfYWRkX2tleGVjX2J1ZmZlcigpLCB0aG91Z2h0CkknbSBub3Qg
c3VyZSB3aHkgaXQgYWRkZWQgYSBOVUxMIHNlZ21lbnQsIGJ1dCBpdCBpcyBubyBoYXJtIHRvIGFk
ZCBhCk5VTEwgY2hlY2tlciBoZXJlIGluIGNhc2UgYW55IG90aGVyIHNjZW5hcmlvcyBzaW1pbGFy
IGFzIElNQS4KCj4KPiA+Cj4gPiBGaXggdGhpcyBieSBzaW1wbHkgYWRkaW5nIGEgY2hlY2sgYmVm
b3JlIGNvcHkuCj4gPgo+ID4gRml4ZXM6IGI3ZmI0ZDc4YTZhZCAoIlJJU0MtVjogdXNlIG1lbWNw
eSBmb3Iga2V4ZWNfZmlsZSBtb2RlIikKPiA+IEFja2VkLWJ5OiBCYW9xdWFuIEhlIDxiaGVAcmVk
aGF0LmNvbT4KPiA+IEFja2VkLWJ5OiBQcmF0eXVzaCBZYWRhdiA8cHJhdHl1c2hAa2VybmVsLm9y
Zz4KPiA+IFNpZ25lZC1vZmYtYnk6IFRhbyBMaXUgPGx0YW9AcmVkaGF0LmNvbT4KPiA+IC0tLQo+
ID4KPiA+IHYzIC0+IHYyOiBBZGQgZml4ZXMgdGFnOyBSZXBsYWNlICJyZWZlcmVuY2UiIHRvICJk
ZXJlZmVyZW5jZSIuCj4gPiBsaW5rIHRvIHYyOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51
eC1yaXNjdi8yMDI2MDYyNzIyMjYwMi4yMzU5NC0yLWx0YW9AcmVkaGF0LmNvbS8KPiA+IGxpbmsg
dG8gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjYwNTI5MDMyNzM5
LjEzMjY0LTItbHRhb0ByZWRoYXQuY29tLwo+ID4KPiA+IC0tLQo+ID4gIGFyY2gvcmlzY3Yva2Vy
bmVsL21hY2hpbmVfa2V4ZWMuYyB8IDcgKysrKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA3IGlu
c2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvbWFjaGlu
ZV9rZXhlYy5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvbWFjaGluZV9rZXhlYy5jCj4gPiBpbmRleCAy
MzA2Y2UzZTVmMjIuLmFmYzY4ZjZhNGFhMSAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3Yva2Vy
bmVsL21hY2hpbmVfa2V4ZWMuYwo+ID4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvbWFjaGluZV9r
ZXhlYy5jCj4gPiBAQCAtNDEsNiArNDEsMTMgQEAgbWFjaGluZV9rZXhlY19wcmVwYXJlKHN0cnVj
dCBraW1hZ2UgKmltYWdlKQo+ID4gICAgICAgICAgICAgICBpZiAoaW1hZ2UtPnNlZ21lbnRbaV0u
bWVtc3ogPD0gc2l6ZW9mKGZkdCkpCj4gPiAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7
Cj4gPgo+ID4gKyAgICAgICAgICAgICAvKgo+ID4gKyAgICAgICAgICAgICAgKiBTb21lIHNlZ21l
bnRzIChlLmcuIElNQSkgcmVzZXJ2ZSBzcGFjZSBidXQgaGF2ZSBubyBidWZmZXIKPiA+ICsgICAg
ICAgICAgICAgICogbG9hZGVkIHlldC4gU2tpcCB0aGVtIGFzIHRoZXkgY2Fubm90IGNvbnRhaW4g
YW4gRkRULgo+ID4gKyAgICAgICAgICAgICAgKi8KPgo+IFRoaXMgaXMgZGVzdGluZWQgdG8gcm90
IG92ZXIgdGltZS4gSXQgYWxzbyBhZGRzIHVwIGFsc28gcG90ZW50aWFsbHkgdG8KPiB0aGUgYmFj
a3BvcnRpbmcgZWZmb3J0IHdoaWxlIGJhY2twb3J0aW5nIHRvIHN0YWJsZSBrZXJuZXMuIEFuZCBt
b3N0Cj4gaW1wb3J0YW50bHkuIFBsZWFzZSwgZG9uJ3QgZG9jdW1lbnQgZXZlcnkgb3RoZXIgbnVs
bCBjaGVjay4KCk9LLCB3aWxsIGdldCByaWQgb2YgaXQuCgpUaGFua3MsClRhbyBMaXUKCj4KPiA+
ICsgICAgICAgICAgICAgaWYgKGltYWdlLT5zZWdtZW50W2ldLmJ1ZiA9PSBOVUxMKQo+Cj4gaWYg
KCFpbWFnZS0+c2VnbWVudHNbaV0uYnVmKQo+Cj4gPiArICAgICAgICAgICAgICAgICAgICAgY29u
dGludWU7Cj4gPiArCj4gPiAgICAgICAgICAgICAgIGlmIChpbWFnZS0+ZmlsZV9tb2RlKQo+ID4g
ICAgICAgICAgICAgICAgICAgICAgIG1lbWNweSgmZmR0LCBpbWFnZS0+c2VnbWVudFtpXS5idWYs
IHNpemVvZihmZHQpKTsKPiA+ICAgICAgICAgICAgICAgZWxzZSBpZiAoY29weV9mcm9tX3VzZXIo
JmZkdCwgaW1hZ2UtPnNlZ21lbnRbaV0uYnVmLCBzaXplb2YoZmR0KSkpCj4gPiAtLQo+ID4gMi41
NC4wCj4gPgo+ID4KPgo+IEJSLCBKYXJra28KPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
