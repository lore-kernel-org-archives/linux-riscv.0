Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B701EDB7EB
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Apr 2026 10:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5izbN3oxX5aJ35ERFQ5b9CIWhQcRjROtE8MVCV4NOlo=; b=P15FYeiYuE1zQe
	w3m4J29/M9DcXVoODbZEZ6BKUmN4YZ6OLx8d1pHruMf8CWy78bJo9VbHThso+7PrP2EOaE15Q7D7Y
	7YEr4z93DPTBHpt2gMekm5B8BhPfkO+2RBhKoKsdlDWRk2mbpsCB3vII2cPn4XMmG2iGPOXXFc52z
	0hGLYgu0BoPqcemyBtAvWypP1K09r6NZadJYU+sswIMsPNNnijlwRYSgrKjZUsvJrRKJWNvrQhSwJ
	i0jS+crxQQOGDNfPBv+j91glbYJ1vpqD1rzwZhsu9qcKFP+t70pv3HlIjBDvUbi69/XaTVnJUQ7Oo
	ivHj6fr15olqMDwDL/IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA3gy-00000006IFJ-3jzY;
	Tue, 07 Apr 2026 10:29:56 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA3gw-00000006IDs-1Bcs
	for linux-riscv@lists.infradead.org;
	Tue, 07 Apr 2026 10:29:55 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5a2b636b944so5072705e87.1
        for <linux-riscv@lists.infradead.org>; Tue, 07 Apr 2026 03:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775557792; x=1776162592; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3KUFRYM7uo6PHZh70JDXGJABWfyo8JyfSs37/SAoz8M=;
        b=RoHZYODxM6OOheTKtUZInMiYVjJ2NTdgZ4acmTR0Px8Rp/36qmE2i9UcUMp6GZ43VI
         2HJilo39/78M2pN8rlk28zzS71D5a3KlUv7sQpm7fFVwicL9ETKB+jUJ4+O3d7uRaHq8
         VZKGSag1zEgQw2R01oa5FnYflECx2Q1v76oZ4YVN0tYMs3671KNJdivUFjHBtCZV2hF4
         LOiDxlCy5fctWk9yWkFhxFVfvNRR8xHb0F+d0bnkasZLU7c5rGkGvTN76rVQ+NWpfU/5
         A5hJQHcUTaeQFYkAMHdZXX8kTW7s0YvZPOvY9WSDv1jq1WwnBJ6HCDqlkopSw+5ZKa3a
         d5kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775557792; x=1776162592;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3KUFRYM7uo6PHZh70JDXGJABWfyo8JyfSs37/SAoz8M=;
        b=M9rVHDXFD0eb3Hf8nubHdXUUc9hwdY3zleSFalRf+wbFbxZQOxlPPzmmCiFMkhqAsr
         TIEUJgeUMAqjh5HQoeEjRXoPGXmNhhE5tAWmMtu3nJeWVjJLmX7c8PUeqYamKi/MucPo
         mY6MwGlwrKevgIzvcbwTp2iYP8NBO+TKOBQNqn1+17lLAy+TyWIoK/MSzopVhAtUnNiC
         B1WezgYN66a15VMAH6B8OMJFO6eVyfuN/Q2jJ+eJVa1w/EQVpfIfy9EByxhUP271J6n0
         0/WKjh4VlI2kDRhujbTj/nJe4CF9dgv5BhkueLFHl1Z/p9a2tPe+sQBAR1LAqI5jJgog
         /MmQ==
X-Gm-Message-State: AOJu0Yzv1+ghuylSBg7c7O5nsWZsPKXW3nJMOB6oPsFEYTJms76f1hY2
	PBuaAFeM/GVL0XqSFG1yr37ZGKfCvlhSdvs2ZFtx5CdkNY9eCJ2WpxT3
X-Gm-Gg: AeBDietdrmaJJXhVplmqRlsn/ECukcaLzndaLIAiEMr/mhn0Duk4ywlhTfmUtQkKg1L
	DOLDln0g0snEVt6xZ3z5tuJ1ddjC9TO6DkBHol70N/HdkcHvlGc6fxZ04RGtt7x/vPTxqztIUyz
	6fpOutMD7kKCDsDWNuqmI5kYGFY2dVfUMhYcrYPmhXvApklJbBWPqrcIL303PeDdnE7IWT6HYSE
	xebcn6AmohG1g+eAgWSJ6q1YFlpUCjt6x4pXnnhaaORV3Iys7PXF//0QtbNM6UHaCIotdPkI6gd
	HMkAg0ZdzaO1pmegIfZdeE8rsOJ84Tar+k19CwCEpifQ2ZqpQhg5IGi3XnZ+FnRQbQwl9iP6K2b
	1Z2QojVTjlFtOP8HyyL0e2wjMn+p8PoMdCED+Ia1W6swV3etGrsu2WtRIUaTsnmarz1DDQ/7im2
	m4eXYgNYB/he0TrCowlOFYOY15FuUdsQRf9UUJJSI=
X-Received: by 2002:a05:6512:39d3:b0:5a2:a525:511e with SMTP id 2adb3069b0e04-5a33754ed82mr5198883e87.3.1775557791400;
        Tue, 07 Apr 2026 03:29:51 -0700 (PDT)
Received: from imamay-pc ([46.73.133.192])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6ccc3adsm4012574e87.55.2026.04.07.03.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 03:29:50 -0700 (PDT)
Date: Tue, 7 Apr 2026 13:29:49 +0300
From: Ilya Mamay <mmamayka01@gmail.com>
To: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, shuah@kernel.org
Subject: Re: [PATCH v3 1/2] riscv: Introduce support for hardware
 break/watchpoints
Message-ID: <20260407102949.yjsihtpgkau6fndl@imamay-pc>
References: <20260223044918.1359983-1-himanshu.chauhan@oss.qualcomm.com>
 <20260223044918.1359983-2-himanshu.chauhan@oss.qualcomm.com>
 <20260318120019.z656r53gkv6kulq6@imamay-pc>
 <CA+Ht8=ZDH+o9ocgDpX+JQ0TQONYn_eVRiEGedeauUoa4tsK6nw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+Ht8=ZDH+o9ocgDpX+JQ0TQONYn_eVRiEGedeauUoa4tsK6nw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_032954_339412_261E768F 
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

SGksIEhpbWFuc2h1CgpUaGFua3MgZm9yIHlvdXIgcmVwbHkuIEhvd2V2ZXIsIGNvdWxkIHlvdSBw
bGVhc2UgZXhwbGFpbiB0aGUgYWN0dWFsIHB1cnBvc2Ugb2YKdGhpcyBlY2FsbF9sb2NrPyBJIHN0
aWxsIGRvbid0IHVuZGVyc3RhbmQgd2h5IGl0IGlzIG5lZWRlZC4KCk9uIE1vbiwgQXByIDA2LCAy
MDI2IGF0IDEwOjIxOjA2QU0gKzA1MzAsIEhpbWFuc2h1IENoYXVoYW4gd3JvdGU6Cj4gSGksCj4g
Cj4gT24gV2VkLCBNYXIgMTgsIDIwMjYgYXQgNTozMOKAr1BNIElseWEgTWFtYXkgPG1tYW1heWth
MDFAZ21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBIaSwKPiA+Cj4gPiBUaGFuayB5b3UgZm9yIHRo
aXMgcGF0Y2ggLSBpdDtzIGEgdmFsdWFibGUgYWRkaXRpb24gdG8gdGhlIFJJU0MtViBIQlAgc3Vw
cG9ydC4KPiA+IEkgaGF2ZSBvbmUgcXVlc3Rpb24gcmVnYXJkaW5nIHRoZSBsb2NraW5nOgo+ID4K
PiA+IE9uIE1vbiwgRmViIDIzLCAyMDI2IGF0IDEwOjE5OjE3QU0gKzA1MzAsIEhpbWFuc2h1IENo
YXVoYW4gd3JvdGU6Cj4gPiA+ICtpbnQgYXJjaF9pbnN0YWxsX2h3X2JyZWFrcG9pbnQoc3RydWN0
IHBlcmZfZXZlbnQgKmV2ZW50KQo+ID4gPiArewo+ID4gPiArICAgICBzdHJ1Y3QgYXJjaF9od19i
cmVha3BvaW50ICpicCA9IGNvdW50ZXJfYXJjaF9icChldmVudCk7Cj4gPiA+ICsgICAgIHVuaW9u
IHNiaV9kYnRyX3NobWVtX2VudHJ5ICpzaG1lbSA9IHRoaXNfY3B1X3B0cihzYmlfZGJ0cl9zaG1l
bSk7Cj4gPiA+ICsgICAgIHN0cnVjdCBzYmlfZGJ0cl9kYXRhX21zZyAqeG1pdDsKPiA+ID4gKyAg
ICAgc3RydWN0IHNiaV9kYnRyX2lkX21zZyAqcmVjdjsKPiA+ID4gKyAgICAgc3RydWN0IHBlcmZf
ZXZlbnQgKipzbG90Owo+ID4gPiArICAgICB1bnNpZ25lZCBsb25nIGlkeDsKPiA+ID4gKyAgICAg
c3RydWN0IHNiaXJldCByZXQ7Cj4gPiA+ICsgICAgIGludCBlcnIgPSAwOwo+ID4gPiArCj4gPiA+
ICsgICAgIHJhd19zcGluX2xvY2tfaXJxc2F2ZSh0aGlzX2NwdV9wdHIoJmVjYWxsX2xvY2spLAo+
ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgKnRoaXNfY3B1X3B0cigmZWNhbGxfbG9j
a19mbGFncykpOwo+ID4KPiA+IENvdWxkIHlvdSBjbGFyaWZ5IHRoZSBwdXJwb3NlIG9mIHRoZSBl
Y2FsbF9sb2NrIGluIGFyY2hfaW5zdGFsbF9od19icmVha3BvaW50IGFuZAo+ID4gYXJjaF91cGRh
dGVfaHdfYnJlYWtwb2ludD8gV2h5IGlzIGl0IHVzZWQgb25seSBpbiB0d28gZnVuY3Rpb25zIG1l
bnRpb25lZCBhYm92ZSwKPiA+IGJ1dCBub3QgaW4gb3RoZXIgUE1VIGNhbGxiYWNrcyBsaWtlIGFy
Y2hfdW5pbnN0YWxsX2h3X2JyZWFrcG9pbnQ/Cj4gPgo+IEkgcHJvYmFibHkgbWlzc2VkIGl0IGlu
IGFyY2hfdW5pbnN0YWxsX2h3X2JyZWFrcG9pbnQuIEkgd2lsbCB0YWtlIGNhcmUgb2YgaXQuCj4g
Cj4gVGhhbmtzICYgUmVnYXJkcwo+IEhpbWFuc2h1Cj4gCj4gPiBSZWdhcmRzCj4gPiBJbHlhCj4g
Pgo+ID4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
ID4gPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiA+ID4gbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwo+ID4gPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
