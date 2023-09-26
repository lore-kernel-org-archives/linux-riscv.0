Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCA04E7D246
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Sep 2023 07:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ECl4kPtpeb1jdDvWLb8wNffG1l7dLphkmpf2+Nd+5Nw=; b=16HtIimBito9tI
	DDNdwhinogHOYmSxiF2saRiat22U6R2t+4w7YaeGzRLawSj32DrWle6s/GERoW+nRS/lf07hBptEW
	4x14ZWLvWqIhaINjlTcIUpmMW0ph20Je6Z+kENVQ0ObQiyrlUqBYylzUs5DvJsnKz8xdkvtWWlEMp
	K9/eDsypj4iIjR+Vbgkqs+mqGKTtfB5p7tqQb7tvd5+16tvdweHJx1SILj4FnY0OvipiaIqliSp33
	WRi8auKH4joyCvgr79k5EtRaCkWG1r5cLyDBD1RC/fz9B7gtH+WS8eKynZls6cX8+uRiK+Y4PikY7
	/efqjIYdjIlKBwg29lHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ql2eV-00FoF3-0j;
	Tue, 26 Sep 2023 07:38:39 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ql2eS-00FoE8-1t
	for linux-riscv@lists.infradead.org;
	Tue, 26 Sep 2023 07:38:37 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-65b0a54d436so21007936d6.3
        for <linux-riscv@lists.infradead.org>; Tue, 26 Sep 2023 00:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695713912; x=1696318712; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/27Fg5u72g9kvgafrBJAucjZrohxNI5dpw0DZZayMMA=;
        b=iMoIE4yckMmX7P4GBFbDHVOUon8omJsRELehA0rS15vhWzhv2C8HUJodD5FvbKPTlg
         YOCEVo4XGNi2bNv6U7FsXxDju5cMut/06WXHDtP/Ud+QuPdkN0HSxBBGMWIMmVKVLyM9
         ksA3elr73SpeMnHw5O20DNG3qft0uz+rDpi98CyLJOll+dH5xiGfhYiF0q/qc7k5RYmA
         6pFPC9RlRwItwOfaBQQ9ceGSxZQvy3Cy25yNTF1rWWInK80TMmz1wsge5bpMvvoDX7+j
         Iv4k+EzHXzcudKHnmXLC43cbO9Y4opg6KUuyBk2eYNGovV6HaqzIMbD5HoU+0T0KONmb
         Kk0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695713912; x=1696318712;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/27Fg5u72g9kvgafrBJAucjZrohxNI5dpw0DZZayMMA=;
        b=az801QQ8AiiEZ43DvLTE28amM4AF14WoM3cYbU9nJcVffa4YiI39H6pmrq8oCT+rxX
         TKw6sjt6pFIglPdjYKkDcAcuQmi7cXQ+Jiu2ldMnOD9uwnPk2REy4q2nlxWoMoe2NlL4
         Y3pKqDdV4swp/OL2V4kaDrUNMd0HsH0JjIqnWoT2yoXDPyTqdJyOp2XXOdz+PBtT5yUw
         DXWPoqx8eXgcFiyCWe3Qpv6BmMNe7dPbhlOcAdo/my1wMMnFmP7uvAdhKNZjLJg44ibd
         Nl1aIVVBrdoKuBUa36WguE6i3xTHEuGXq+gjVYwEd77zhm2Pp/KNyja7FPwmefnP5qPs
         2IBw==
X-Gm-Message-State: AOJu0YwGbFVqzRmwtdt5ESdO6uz2aJUR5PxOosaXvze7wc46Pb2MMqG+
	jPR43l6hjkGoLRAcBWnkCvc9sU40jOFk2n4+3uY=
X-Google-Smtp-Source: AGHT+IH5GGWDwUTM2/VMHJHk6heCTbLLWR+CtE7yZz/A0eO0teEhx/fcpYu4iA90waY1nizPw8gcqa3tPVDjn/N3gYg=
X-Received: by 2002:a0c:aa93:0:b0:653:583d:d400 with SMTP id
 f19-20020a0caa93000000b00653583dd400mr8098108qvb.52.1695713911865; Tue, 26
 Sep 2023 00:38:31 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1695189879.git.wangchen20@iscas.ac.cn> <888d57a2d5e62affb8e29e0098402e428facd969.1695189879.git.wangchen20@iscas.ac.cn>
 <bcdc4623-a37e-455b-8f10-c539e2b04554@codethink.co.uk> <CAJM55Z_o7Z8HhaUjrSqjxy1cPjud9Q3GrdqjgFThToxxOCrkgw@mail.gmail.com>
In-Reply-To: <CAJM55Z_o7Z8HhaUjrSqjxy1cPjud9Q3GrdqjgFThToxxOCrkgw@mail.gmail.com>
From: Chen Wang <unicornxw@gmail.com>
Date: Tue, 26 Sep 2023 15:38:19 +0800
Message-ID: <CAHAQgRCtWY5pDroDNcWSXpsPaHY1=0L9u_BjB8iWaOY44BkYdQ@mail.gmail.com>
Subject: Re: [PATCH v2 08/11] serial: 8250_dw: Add Sophgo SG2042 support
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Ben Dooks <ben.dooks@codethink.co.uk>, aou@eecs.berkeley.edu, chao.wei@sophgo.com, 
	conor@kernel.org, devicetree@vger.kernel.org, guoren@kernel.org, 
	jszhang@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, robh+dt@kernel.org, 
	xiaoguang.xing@sophgo.com, Chen Wang <wangchen20@iscas.ac.cn>, haijiao.liu@sophgo.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_003836_624260_CC3455A6 
X-CRM114-Status: GOOD (  14.21  )
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

RW1pbCBSZW5uZXIgQmVydGhpbmcgPGVtaWwucmVubmVyLmJlcnRoaW5nQGNhbm9uaWNhbC5jb20+
IOS6jjIwMjPlubQ55pyIMjLml6XlkajkupQgMTg6NDDlhpnpgZPvvJoKPgo+IEJlbiBEb29rcyB3
cm90ZToKPiA+IE9uIDIwLzA5LzIwMjMgMDc6NDAsIENoZW4gV2FuZyB3cm90ZToKPiA+ID4gRnJv
bTogRW1pbCBSZW5uZXIgQmVydGhpbmcgPGVtaWwucmVubmVyLmJlcnRoaW5nQGNhbm9uaWNhbC5j
b20+Cj4gPiA+Cj4gPiA+IEFkZCBxdWlyayB0byBza2lwIHNldHRpbmcgdGhlIGlucHV0IGNsb2Nr
IHJhdGUgZm9yIHRoZSB1YXJ0cyBvbiB0aGUKPiA+ID4gU29waGdvIFNHMjA0MiBTb0Mgc2ltaWxh
ciB0byB0aGUgU3RhckZpdmUgSkg3MTAwLgo+ID4KPiA+IEknZCBsb3ZlIGFuIGFjdHVhbCBleHBs
YW5hdGlvbiBvZiB3aHkgdGhpcyBpcyBuZWNlc3NhcnkgaGVyZS4KPgo+IE1ha2VzIHNlbnNlLiBG
b3IgdGhlIEpINzEwMCB0aGUgY29tbWl0IG1lc3NhZ2UgaXM6Cj4KPiAgIE9uIHRoZSBTdGFyRml2
ZSBKSDcxMDAgUklTQy1WIFNvQyB0aGUgVUFSVCBjb3JlIGNsb2NrcyBjYW4ndCBiZSBzZXQgdG8K
PiAgIGV4YWN0bHkgMTYgKiAxMTUyMDBIeiBhbmQgbWFueSBvdGhlciBjb21tb24gYml0cmF0ZXMu
IFRyeWluZyB0aGlzIHdpbGwKPiAgIG9ubHkgcmVzdWx0IGluIGEgaGlnaGVyIGlucHV0IGNsb2Nr
LCBidXQgbG93IGVub3VnaCB0aGF0IHRoZSBVQVJUJ3MKPiAgIGludGVybmFsIGRpdmlzb3IgY2Fu
J3QgY29tZSBjbG9zZSBlbm91Z2ggdG8gdGhlIGJhdWQgcmF0ZSB0YXJnZXQuCj4gICBTbyByYXRo
ZXIgdGhhbiB0cnkgdG8gc2V0IHRoZSBpbnB1dCBjbG9jayBpdCdzIGJldHRlciB0byBza2lwIHRo
ZQo+ICAgY2xrX3NldF9yYXRlIGNhbGwgYW5kIHJlbHkgc29sZWx5IG9uIHRoZSBVQVJUJ3MgaW50
ZXJuYWwgZGl2aXNvci4KPgo+IEBDaGVuIFdhbmcgaXMgdGhpcyBhbHNvIHRydWUgZm9yIHRoZSBT
RzIwNDI/Cj4KPiAvRW1pbAoKRW1pbCAmIEJlbiwKQWZ0ZXIgZG91YmxlLWNoZWNraW5nIHdpdGgg
U29waGdvIGVuZ2luZWVycyBhbmQgZG9pbmcgbW9yZQppbnZlc3RpZ2F0aW9uLCB3ZSB0aGluayB0
aGUgb3JpZ2luYWwgY2hhbmdlcyhxdWlyayB0byBza2lwIHNldHRpbmcgdGhlCmlucHV0IGNsb2Nr
KSBvbiBVQVJUIG1heSBub3QgIGJlIHJlcXVpcmVkLiBEdWUgdG8gY3VycmVudGx5LCB0aGUKdGFy
Z2V0IG9mIHRoaXMgcGF0Y2hzZXQgaXMganVzdCB0byBlbmFibGUgYSBtaW5pbWFsIHN5c3RlbSBh
bmQgbm8KY2xvY2sgcmVsYXRlZGluZyBjaGFuZ2VzIGFyZSBpbmNsdWRlZCB5ZXQuIEkgd2lsbCBm
aXJzdCByZW1vdmUgdGhpcwpxdWlyayBjaGFuZ2Ugb24gVUFSVCBhbmQgdXNlIHRoZSBmaXhlZCBm
cmVxdWVuY2UgLSA1MDBNIC0gYW5kIHJlcGx5CnNvbGVseSBvbiB0aGUgVUFSVCdzIGludGVybmFs
IGRpdmlzb3IgdG8gd29yay4gV2Ugd2lsbCByZS1ldmFsdWF0ZQp0aGlzIHF1aXJrIGNoYW5nZSBp
biBuZXh0IHBhdGNoc2V0IHdoZW4gd2UgaW52b2x2ZSBjbG9jayByZWxhdGVkCnN0dWZmLgpMb29w
aW5nIEhhaWppYW8sIGVuZ2luZWVyIGZyb20gU29waGdvLCB3aG8gaXMgd29ya2luZyBvbiBjbG9j
ayBvbiBzZzIwNDIuCgpSZWdhcmRzLApDaGVuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
