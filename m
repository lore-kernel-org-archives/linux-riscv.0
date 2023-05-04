Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8955DC7EE23
	for <linux-riscv@archiver.kernel.org>; Thu,  4 May 2023 09:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GxfHDg7nzqjObizQJNLOimi4lWwVRiowY9NW99AlkhQ=; b=3qxEiWa804pmXk
	UgYAscoBjv42bzhPuXr3d6daFXoakSdHl+pKdY5M/iRjQRmqsHzzaZgqdi/D898e6J3M7lk3PYqAo
	05pSXCMWjDo8qNuYmFiYguhdq5/8HUsNDB8ojPOs5q7vebXv5vR0BSXlTi/m5n7Y/VCQlDNkAquiw
	thkpz+FcndJuJCxO0/Oby8+WEB8nHF5LBoBV8EA7xGyWoYbuvCW3N6ZpPKH2I0Lt/OLmfr36ctapf
	1JWIcK1WnQr1Ng0Swt/izZ0HJp4ZNHH7jQhSbuezEnp3jm3hSxrpdvoPeOh9pTUdc9PeC97/WdpQK
	GVkoURjU/k1qm800E60Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puV1L-007Dec-2Y;
	Thu, 04 May 2023 09:13:03 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puV1I-007Dcr-2t
	for linux-riscv@lists.infradead.org;
	Thu, 04 May 2023 09:13:02 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-3310c01beb9so1973935ab.2
        for <linux-riscv@lists.infradead.org>; Thu, 04 May 2023 02:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1683191577; x=1685783577;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I+cBCuPemC9rnV8/QfSp10iYbH/9Adn653+lN+Obdqg=;
        b=YTbeCmGImxGvcLEuyfRZE5cMmqFs1C7MvVoUxmYjqrBcwYCW5hdd6Vs5090lxFVFvf
         ms6o/bOQuPW+RHlFflrZxWSNvNZfa2GTXN7kYDBnfp7UpeQb2uvOslAhscBflo4txXBK
         kH5qgmCiSEQLeVbqjiDAOmkjZ3M92AS3ZDKgHkR8SVesM7c6IXbaXJrlX+3k0bXWbSI6
         /2VI27NyGcrDQ4IhOLeL/VkQySMf/IEeUFwpMhrXJAlWpPDE6xpbRP+n4BdB8z6tZzWX
         AgrPwqBVi/lvENt1iHCHZNcLSad1iYfmSPgmhiDl1RlpwPuyrerZ7NBeDsUZWsRvqDBQ
         pZug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683191577; x=1685783577;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I+cBCuPemC9rnV8/QfSp10iYbH/9Adn653+lN+Obdqg=;
        b=f8sfE1NRJxt17nGnq8ancXBDTyAn7i/SknWvRKQnaBfR7IKzEi6ao6FRmroeEmSwUc
         WSDubjEs/IESNb0NPW5YpYLTZxRwcWHPJ3y7nwWupq6pNAwhNlcGyDdY+iyGze5cFg1I
         GX9bEpukNV9fGJdg/G+xORnPDMmAtwr5RcjQR7BlS0G3qgB7/YknL6dI/tgL7xrcmxhy
         +YkUnSuT+c4aKtdMsvy/IUKhALhiK8CMgeIGkhd/wo/RsH0eXIJgHI+WfnveQmlHSFC4
         5YgMotC/XbxBJRx+jesym9q3pLS84+rJ4pcDG6X1qGztrtn9lsAjRvq9pQrxqjiojqYA
         lnGQ==
X-Gm-Message-State: AC+VfDy/RZPfM4nJ334/4Vz8ugp2crfemGnCWcApoS8br7w3wUZ+p/eZ
	cLpyADkQTMfIMkEgIR9eZGCSnQal74uD3AAs/u07yQ==
X-Google-Smtp-Source: ACHHUZ7XzaFfYqsZ2DDqFN4AT6ORAT0qObZMB+f1YXKGsdQZ574TA025qZT7Zk/wE7euYGocFKi/txlwd67zHtlkOJo=
X-Received: by 2002:a92:c743:0:b0:331:3fe3:d111 with SMTP id
 y3-20020a92c743000000b003313fe3d111mr5296592ilp.25.1683191576814; Thu, 04 May
 2023 02:12:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230426074248.19336-1-zong.li@sifive.com> <mhng-cdb02a07-40f9-4424-b3cf-938247588537@palmer-ri-x1c9>
In-Reply-To: <mhng-cdb02a07-40f9-4424-b3cf-938247588537@palmer-ri-x1c9>
From: Zong Li <zong.li@sifive.com>
Date: Thu, 4 May 2023 17:12:45 +0800
Message-ID: <CANXhq0r3+Wc3jZ7fVRS-RtVUTNM-tZjhvFO7qK_BmSCa4wdGyw@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: xilinx: enable on RISC-V platform
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230504_021300_981588_92A6FB15 
X-CRM114-Status: GOOD (  16.24  )
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

T24gV2VkLCBBcHIgMjYsIDIwMjMgYXQgMTA6MjjigK9QTSBQYWxtZXIgRGFiYmVsdCA8cGFsbWVy
QGRhYmJlbHQuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgMjYgQXByIDIwMjMgMDA6NDI6NDggUERU
ICgtMDcwMCksIHpvbmcubGlAc2lmaXZlLmNvbSB3cm90ZToKPiA+IEVuYWJsZSB0aGUgeGlsaW54
IGRtYWVuZ2luZSBkcml2ZXIgb24gUklTQy1WIHBsYXRmb3JtLiBXZSBoYXZlIHZlcmlmaWVkCj4g
PiB0aGUgQ0RNQSBvbiBSSVNDLVYgcGxhdGZvcm0sIGVuYWJsZSB0aGlzIGNvbmZpZ3VyYXRpb24g
dG8gYWxsb3cgYnVpbGQgb24KPiA+IFJJU0MtVi4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBab25n
IExpIDx6b25nLmxpQHNpZml2ZS5jb20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2RtYS9LY29uZmln
IHwgMiArLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS9LY29uZmlnIGIvZHJpdmVycy9kbWEv
S2NvbmZpZwo+ID4gaW5kZXggZmI3MDczZmMwMzRmLi44MTZmNjE5ODA0YjkgMTAwNjQ0Cj4gPiAt
LS0gYS9kcml2ZXJzL2RtYS9LY29uZmlnCj4gPiArKysgYi9kcml2ZXJzL2RtYS9LY29uZmlnCj4g
PiBAQCAtNjk1LDcgKzY5NSw3IEBAIGNvbmZpZyBYR0VORV9ETUEKPiA+Cj4gPiAgY29uZmlnIFhJ
TElOWF9ETUEKPiA+ICAgICAgIHRyaXN0YXRlICJYaWxpbnggQVhJIERNQVMgRW5naW5lIgo+ID4g
LSAgICAgZGVwZW5kcyBvbiAoQVJDSF9aWU5RIHx8IE1JQ1JPQkxBWkUgfHwgQVJNNjQpCj4gPiAr
ICAgICBkZXBlbmRzIG9uIChBUkNIX1pZTlEgfHwgTUlDUk9CTEFaRSB8fCBBUk02NCB8fCBSSVND
VikKPiA+ICAgICAgIHNlbGVjdCBETUFfRU5HSU5FCj4gPiAgICAgICBoZWxwCj4gPiAgICAgICAg
IEVuYWJsZSBzdXBwb3J0IGZvciBYaWxpbnggQVhJIFZETUEgU29mdCBJUC4KPgo+IEFja2VkLWJ5
OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5jLmNvbT4KCkhpIFBhbG1lciwKVGhhbmtz
IGZvciB5b3VyIHJldmlldy4KCkhpIFZpbm9kLApDb3VsZCBJIGtub3cgaWYgdGhpcyBwYXRjaCBh
bHNvIG1lZXRzIHlvdXIgZXhwZWN0YXRpb25zPyBJZiBpdCBkb2VzLAp3b3VsZCB5b3UgcGxlYXNl
IGNvbnNpZGVyIGFjY2VwdGluZyBpdD8KVGhhbmtzLgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
