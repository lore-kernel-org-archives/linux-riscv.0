Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 272D7C47DDB
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jan 2024 07:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a89pBZFr6zZzw3X+bfimH9fyuH8Nkh3XU7qeZ3qy1iI=; b=riHd8cr8zRYNhY
	zz6b9hxtMsYbFWfx7anM3w6YSezAlO1JghkL303kk3Gd4bHd5r2rOkSUIUmMfklhjsVj7VDHEEaxN
	sldYJ5qj54wgGc6w6tP04DY/TF8UMCFvf0DLV3lFDRkyOAIZuLN9WZwrA8eFFeVoR8YuKymARZdmc
	YmBbbmdJy6GPMTHa22fVPJS71ciEpKUmpJc27rzVKcHg98drVAgMAOcYO7u4u1y2KH/YmJdP4B7TK
	J2JigVO8hLXKPss5sTCIGTqSHRTRWszmMzRfihMsbK65OhMyN53L7PZQlrztobpCSrD0yV9qpKXUb
	7gktR0gFZpzBYUyeWHkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTGMc-00000003Jq7-2ItG;
	Fri, 26 Jan 2024 07:10:58 +0000
Received: from out4-smtp.messagingengine.com ([66.111.4.28])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTGMa-00000003Jph-1Vdf
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jan 2024 07:10:57 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id B62C55C0130;
	Fri, 26 Jan 2024 02:10:51 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Fri, 26 Jan 2024 02:10:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1706253051;
	 x=1706339451; bh=vx8aBoq4VDpfChLhvsXQYuGwkmZ2BRhvxF8t7Vyu4Jg=; b=
	hoWZKAtZuT+LukB8FLCxR83ilWjnPIsfKi/l86PvO4GIBkcgKeWot8eR5pzX5F3I
	uSpzxhp4q1s0O4Nii3+reXjpChIgC3o+q5pFh58IqtVxcE4fFjDIrnsDqpRe/y65
	ceY+0HN7zqLddX7TGX6eqgQNuGW2hfrUKXLV8Y9jIdlm9LIHSRX8Y/qAYasleg7D
	rqBn0ZBIatzqst60xBGSdObFPPMr9mFTVQWYUR26cZsn1R72o/yukY9IJySnjptM
	cTsB2i5rGWTIg2IbafcjDORfOaxrPZc9m6F4OAwdcldMdGjgvpMc1fwthCMrwyr2
	YChK3FBJGmonqg9kmu2upQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1706253051; x=
	1706339451; bh=vx8aBoq4VDpfChLhvsXQYuGwkmZ2BRhvxF8t7Vyu4Jg=; b=P
	5qHPd3MMTOVK3RiEaJAKnHXsK15loOdRdZGvxYkfD5OP+cn763UMciSYbrB8bTfu
	46UzQDch0P5AUog0A8A6ScCtzOFQ2/Yp02f9YJrI8EahsGOblQXxbdp0S30w+tbN
	u2xeDvRrgZmHtzGbMs8IND4uXXmZKb51UF8s5S77CZsmW2CbTFW1npCKZUb3sADA
	OovqBqb+7WrXRbTYQOehtrcyJWw/IrOHYS8jLl815lI6dvBKZw7i9PYn1USMpR8O
	0wn9tNtUXGrePd/rbqM9v5fVv3XpMRX9OP8x1/afLvrMSt7pwX6hY0GT9luvHeIo
	xTJnM57TTt8uy/DjasvbQ==
X-ME-Sender: <xms:-1qzZRTxEq28XLD_Zyn_vZvMX_nCeVk72ilXHbODaggVP0C2BT-ALA>
    <xme:-1qzZay5DpQ8JQqfg7gi0fjY29mi6oDjB0g3CSAUin7U5oxzV47CRP4QkMYCgnzik
    k17twiHPs0HGcBpIJE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdeliedguddtvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedf
    tehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrf
    grthhtvghrnhepgeefjeehvdelvdffieejieejiedvvdfhleeivdelveehjeelteegudek
    tdfgjeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:-1qzZW3uBY_SwbNNoP1oIdVVKz60ejnTAdXwFvZUqsqzOGq7xP3WVA>
    <xmx:-1qzZZDeG9Gd659q66HuKy9oCd3pnnIRzFEsVsLNv0raOud_OYRyrA>
    <xmx:-1qzZajn1lvVeqNDXXIiETrYIBCmhLicq2dgGy46EZbfDDjnO4ywEw>
    <xmx:-1qzZVXDLoAD8Dz5EhFuM04HW6PfBSIR47ZacipVNwBqp8eKP6HO-A>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 178C0B6008D; Fri, 26 Jan 2024 02:10:50 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-119-ga8b98d1bd8-fm-20240108.001-ga8b98d1b
MIME-Version: 1.0
Message-Id: <cf70dd11-18fc-4c57-beab-b682f8edb220@app.fastmail.com>
In-Reply-To: <MA0P287MB28229E73972FE184B461511AFE792@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
References: <MA0P287MB28228572C526C5099A8BDA2DFE7B2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
 <0f091a2a-0bc8-42ca-9d5d-aa218fa88e93@app.fastmail.com>
 <MA0P287MB28229E73972FE184B461511AFE792@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Fri, 26 Jan 2024 08:10:30 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Chen Wang" <unicorn_wang@outlook.com>, soc@kernel.org
Cc: "Conor Dooley" <conor@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, "Inochi Amaoto" <inochiama@outlook.com>,
 "Xiaoguang Xing" <xiaoguang.xing@sophgo.com>, haijiao.liu@sophgo.com,
 "Chao Wei" <chao.wei@sophgo.com>
Subject: Re: [GIT PULL] RISC-V Devicetrees fix for Sophgo/SG2042 v6.8-rc1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_231056_500451_16228A4E 
X-CRM114-Status: GOOD (  16.87  )
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

T24gRnJpLCBKYW4gMjYsIDIwMjQsIGF0IDA4OjA2LCBDaGVuIFdhbmcgd3JvdGU6Cj4gT24gMjAy
NC8xLzI2IDE0OjExLCBBcm5kIEJlcmdtYW5uIHdyb3RlOgo+IFsuLi4uLi5dCj4+IFRoZSB0YWcg
ZGVzY3JpcHRpb24gaXMgd2hhdCBnZXRzIHR1cm5lZCBpbnRvIHRoZSBtZXJnZSBjb21taXQKPj4g
d2hlbiBJIHB1bGwgaXQsIHNvIGl0IG5lZWRzIHRvIGJlIHNvbWV0aGluZyB0aGF0IG1ha2VzIHNl
bnNlCj4+IGZvciB0aGUgbG9uZy10ZXJtIGdpdCBoaXN0b3J5IGFzIHdlbGwgYXMgZm9yIG1lIHRv
IHVuZGVyc3RhbmQKPj4gd2h5IEkgbmVlZCB0byBwdWxsIGl0Lgo+Pgo+PiBGb3IgYSBub3JtYWwg
YnJhbmNoLCB0aGF0IHdvdWxkIG1haW5seSBtZWFuIHRoYXQgeW91IHNob3VsZAo+PiBnaXZlIGEg
c3VtbWFyeSBvZiB0aGUgYnJhbmNoIGNvbnRlbnRzLiBJbiB0aGlzIGNhc2UsIEkgc2VlIHlvdQo+
PiBoYXZlIG9ubHkgb25lIHBhdGNoLCBzbyBpdCdzIHByb2JhYmx5IGVhc2llciB0byBzZW5kIHRo
YXQKPj4gcGF0Y2ggdG8gc29jQGtlcm5lbC5vcmcgaW5kaXZpZHVhbGx5LCB3aXRoIHRoZSBzYW1l
IGNjIGxpc3QuCj4KPiBJIGhhdmUgb25lIHF1ZXN0aW9uIGFib3V0IHlvdXIgbWVudGlvbmQgInNl
bmQgdGhhdCBwYXRjaCB0byAKPiBzb2NAa2VybmVsLm9yZyBpbmRpdmlkaXVhbGx5IC4uLiIuwqAg
SWYgSSBzZW50IGl0IGFzIGEgcGF0Y2gsIHdoZXJlIAo+IHNob3VsZCBJIGFkZCB0aGUgZXhwbGFu
YXRpb24gb2Ygd2hhdCBJIGV4cGxhaW5lZCBpbiB0aGlzIEdJVCBQVUxMIGFib3V0IAo+IHRoZSBv
bWlzc2lvbi4gQWZ0ZXIgYWxsLCB0aGUgY29udGVudCBvZiB0aGlzIGV4cGxhbmF0aW9uIGlzIG5v
dCBwYXJ0IG9mIAo+IHRoZSBjb21taXQgb2YgdGhhdCBwYXRjaC4KPgo+IFNob3VsZCBJIHNlbmQg
dGhpcyBwYXRjaCBlbWFpbCBhbmQgdGhlbiByZXBseSBpdCwgYW5kIHRoZW4gZXhwbGFpbiBpbiAK
PiB0aGUgcmVwbHkgZW1haWw/CgpUaGVyZSBhcmUgdHdvIGNvbW1vbiB3YXlzIG9mIGRvaW5nIGl0
OgoKYSkgWW91IGNhbiBhZGQgZXh0cmEgaW5mb3JtYXRpb24gYmVsb3cgdGhlICctLS0nIGxpbmUg
aW4geW91cgogICBwYXRjaCwgbmV4dCB0byB0aGUgZGlmZnN0YXQuIFRoaXMgdGV4dCB3aWxsIGdl
dCBkcm9wcGVkIGR1cmluZwogICAnZ2l0IGFtJyB3aGVuIEkgcGljayBpdCB1cCBidXQgaXMgYXZh
aWxhYmxlIHdoZW4gSSBsb29rIGF0CiAgIHRoZSBlbWFpbC4KCmIpIFlvdSBjYW4gc2VuZCB0aGUg
cGF0Y2hlcyBhcyBhIHNlcmllcyB1c2luZyAnZ2l0IGZvcm1hdC1wYXRjaAogICAtLWNvdmVyIGxl
dHRlcicgYW5kICdnaXQgc2VuZC1lbWFpbCcuIEluIHRoaXMgY2FzZSwgdGhlIGNvdmVyCiAgIGxl
dHRlciB3aWxsIGJlIG51bWJlcmVkIGFzICdbUEFUQ0ggMC8xXScgYW5kIGFsbG93IHlvdSB0bwog
ICBhZGQgdGhlIHNhbWUga2luZCBvZiBkZXNjcmlwdGlvbiB0aGF0IHdvdWxkIGdvIGludG8gYSBw
dWxsCiAgIHJlcXVlc3QgYnV0IHdvbid0IGJlY29tZSBhIG1lcmdlIGNvbW1pdC4KCiAgICAgICBB
cm5kCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
