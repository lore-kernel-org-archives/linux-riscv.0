Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97CDCC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Dec 2022 12:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0VD/yv55tqqNK6RQ1KgaUbNe/2+b/Ao4YI31a+E570A=; b=QvkbHnTmYOCDZu
	USeQLjMH7vjdRJ0rBzy5bsLSH9hRMvb1TUzPpe6DBro58CfNO8fjMJMdYUfg6J/qtggp1J5v4+nPP
	nXYbfF/NJRkIuzk5WjtMxEK3TMipbGpjHEmjubmFWbWWkXaMtqtknUvcrHQRjObW2XaLAryVPokqU
	nealhZ8aIgFztZ1xDT2RS/XEOKrjZQteMAOXgMdNgUUV5bPIXayUn6MJpjHcinHtj1GgRqhYxTeSd
	eEPkLfgQWCNcZWBhd/TKMQGeIv3pgOjZ0aQXMKtdFJ7lqlXXrUqMj0Jbp5aMKFr5nGzRVQ7HuMW7E
	kTwglGKERSjSkLv+TsOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5nMW-009MHu-93; Thu, 15 Dec 2022 12:29:20 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5nMT-009MGW-21
	for linux-riscv@lists.infradead.org; Thu, 15 Dec 2022 12:29:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671107354;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=azxeLNToEWGXGUFEKotp2Hg2gxmsr4NhJhcqNr+au/c=;
	b=ZlU0vTpSPCMKkJaHkqJ4d9L/xzTDMQJux41Ar7q+HeZnaTfJtClSeMgptxx826xNa9C52A
	+JMsPg0SEWW+ONB2+iNeBG/scqKEROuZhslNgZl1pXQ1gflN+H70GRHLfsOMjKvYGybww3
	kErByUxMgCHS06ASM2TrP5hkGiVpZJw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-267-QVvP-mveMLqOgOHHDbEJ-Q-1; Thu, 15 Dec 2022 07:29:08 -0500
X-MC-Unique: QVvP-mveMLqOgOHHDbEJ-Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CB502299E74A;
	Thu, 15 Dec 2022 12:29:06 +0000 (UTC)
Received: from oldenburg.str.redhat.com (unknown [10.2.16.5])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 38B281121314;
	Thu, 15 Dec 2022 12:29:03 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Darius Rad <darius@bluespec.com>,  Vineet Gupta <vineetg@rivosinc.com>,
  Palmer Dabbelt <palmer@dabbelt.com>,  Andrew Waterman
 <andrew@sifive.com>,  stillson@rivosinc.com,  Paul Walmsley
 <paul.walmsley@sifive.com>,  anup@brainfault.org,  atishp@atishpatra.org,
  guoren@kernel.org,  Conor Dooley <conor.dooley@microchip.com>,
  greentime.hu@sifive.com,  vincent.chen@sifive.com,  andy.chiu@sifive.com,
  arnd@kernel.org,  linux-kernel@vger.kernel.org,
  linux-riscv@lists.infradead.org,  libc-alpha@sourceware.org,
  christoph.muellner@vrull.eu,  Aaron Durbin <adurbin@rivosinc.com>,
  linux@rivosinc.com
Subject: Re: RISCV Vector unit disabled by default for new task (was Re:
 [PATCH v12 17/17] riscv: prctl to enable vector commands)
References: <mhng-975b1d7b-7b3f-4e88-804c-8b22787f9588@palmer-ri-x1c9>
	<e9cf13a9-561a-3438-00f0-41fe2631888d@rivosinc.com>
	<Y5irn63DQkwumfvW@bruce.bluespec.com>
	<8fe9cfaf-2cbc-8de6-3928-067de9113bfc@rivosinc.com>
	<Y5qByfCtpV0uNID3@bruce.bluespec.com>
	<877cysx4yf.fsf@all.your.base.are.belong.to.us>
Date: Thu, 15 Dec 2022 13:28:59 +0100
In-Reply-To: <877cysx4yf.fsf@all.your.base.are.belong.to.us>
 (=?utf-8?Q?=22Bj=C3=B6rn_T=C3=B6pel=22's?=
	message of "Thu, 15 Dec 2022 12:48:56 +0100")
Message-ID: <87h6xwdf5g.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221215_042917_221656_42DFCF30 
X-CRM114-Status: GOOD (  23.04  )
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

KiBCasO2cm4gVMO2cGVsOgoKPj4gRm9yIFNWRSwgaXQgaXMgaW4gZmFjdCBkaXNhYmxlZCBieSBk
ZWZhdWx0IGluIHRoZSBrZXJuZWwuICBXaGVuIGEgdGhyZWFkCj4+IGV4ZWN1dGVzIHRoZSBmaXJz
dCBTVkUgaW5zdHJ1Y3Rpb24sIGl0IHdpbGwgY2F1c2UgYW4gZXhjZXB0aW9uLCB0aGUga2VybmVs
Cj4+IHdpbGwgYWxsb2NhdGUgbWVtb3J5IGZvciBTVkUgc3RhdGUgYW5kIGVuYWJsZSBUSUZfU1ZF
LiAgRnVydGhlciB1c2Ugb2YgU1ZFCj4+IGluc3RydWN0aW9ucyB3aWxsIHByb2NlZWQgd2l0aG91
dCBleGNlcHRpb25zLiAgQWx0aG91Z2ggU1ZFIGlzIGRpc2FibGVkIGJ5Cj4+IGRlZmF1bHQsIGl0
IGlzIGVuYWJsZWQgYXV0b21hdGljYWxseS4gIFNpbmNlIHRoaXMgaXMgZG9uZSBhdXRvbWF0aWNh
bGx5Cj4+IGR1cmluZyBhbiBleGNlcHRpb24gaGFuZGxlciwgdGhlcmUgaXMgbm8gb3Bwb3J0dW5p
dHkgZm9yIG1lbW9yeSBhbGxvY2F0aW9uCj4+IGVycm9ycyB0byBiZSByZXBvcnRlZCwgYXMgdGhl
cmUgYXJlIGluIHRoZSBBTVggY2FzZS4KPgo+IEdsaWJjIGhhcyBhbiBTVkUgb3B0aW1pemVkIG1l
bWNweSwgcmlnaHQ/IERvZXNuJ3QgdGhhdCBtZWFuIHRoYXQgcHJldHR5Cj4gbXVjaCBhbGwgcHJv
Y2Vzc2VzIG9uIGFuIFNWRSBjYXBhYmxlIHN5c3RlbSB3aWxsIGVuYWJsZSBTVkUgKGxhemlseSk/
IElmCj4gc28sIHRoYXQncyBjbG9zZSB0byAiZW5hYmxlZCBieSBkZWZhdWx0IiAodW5sZXNzIFNW
RSBpcyBkaXNhYmxlZCBzeXN0ZW0KPiB3aWRlKS4KClllcywgc2VlIHN5c2RlcHMvYWFyY2g2NC9t
dWx0aWFyY2gvbWVtY3B5LmM6CgogIHN0YXRpYyBpbmxpbmUgX190eXBlb2YgKF9fcmVkaXJlY3Rf
bWVtY3B5KSAqCiAgc2VsZWN0X21lbWNweV9pZnVuYyAodm9pZCkKICB7CiAgICBJTklUX0FSQ0gg
KCk7CiAgCiAgICBpZiAoc3ZlICYmIEhBVkVfQUFSQ0g2NF9TVkVfQVNNKQogICAgICB7CiAgICAg
ICAgaWYgKElTX0E2NEZYIChtaWRyKSkKICAgICAgICAgIHJldHVybiBfX21lbWNweV9hNjRmeDsK
ICAgICAgICByZXR1cm4gX19tZW1jcHlfc3ZlOwogICAgICB9CiAgCiAgICBpZiAoSVNfVEhVTkRF
UlggKG1pZHIpKQogICAgICByZXR1cm4gX19tZW1jcHlfdGh1bmRlcng7CiAgCiAgICBpZiAoSVNf
VEhVTkRFUlgyIChtaWRyKSB8fCBJU19USFVOREVSWDJQQSAobWlkcikpCiAgICAgIHJldHVybiBf
X21lbWNweV90aHVuZGVyeDI7CiAgCiAgICBpZiAoSVNfRkFMS09SIChtaWRyKSB8fCBJU19QSEVD
REEgKG1pZHIpKQogICAgICByZXR1cm4gX19tZW1jcHlfZmFsa29yOwogIAogICAgcmV0dXJuIF9f
bWVtY3B5X2dlbmVyaWM7CiAgfQogIApBbmQgdGhlIF9fbWVtY3B5X3N2ZSBpbXBsZW1lbnRhdGlv
biBhY3R1YWxseSB1c2VzIFNWRS4KCklmIHRoZXJlIHdlcmUgYSBwcmN0bCB0byBzZWxlY3QgdGhl
IHZlY3RvciB3aWR0aCBhbmQgZW5hYmxlIHRoZSB2ZWN0b3IKZXh0ZW5zaW9uLCB3ZSdkIGhhdmUg
dG8gcGljayBhIHdpZHRoIGluIGdsaWJjIGFueXdheS4gIExpa2V3aXNlIGZvciBhbnkKb3RoZXIg
bGliYywgdGhlIEdvIHJ1bnRpbWUsIGFuZCBzbyBvbi4gIFRoYXQncyB3aHkgSSB0aGluayB0aGUg
a2VybmVsIGlzCmluIGEgYmV0dGVyIHBvc2l0aW9uIHRvIGhhbmRsZSB0aGlzLgoKPiBBTVggaXMg
YSBiaXQgZGlmZmVyZW50IGZyb20gU1ZFIGFuZCBWOyBTVkUvViBpcy93b3VsZCBiZSB1c2VkIGJ5
IGdsaWJjCj4gZm9yIG1lbWNweSBhbmQgc3VjaCwgd2hlcmUgSSBkb3VidCB0aGF0IEFNWCB3b3Vs
ZCBiZSB1c2VkIHRoZXJlLiBUaGVuCj4gYWdhaW4sIHRoZXJlJ3MgQVZYNTEyIHdoaWNoIG1hbnkg
YXJndWUgdGhhdCAidHVybmVkIG9uIGJ5IGRlZmF1bHQiIHdhcyBhCj4gbWlzdGFrZSAoQUJJIGJy
ZWFrYWdlL3Bvd2VyIGNvbnN1bXB0aW9uKS4KCkkgZG9uJ3QgdGhpbmsgQU1YIGlzIHVzZWZ1bCBm
b3Igc3RyaW5nIG9wZXJhdGlvbnMgb3IgdGhlIG1hdGggZnVuY3Rpb25zCmN1cnJlbnRseSBpbXBs
ZW1lbnRlZCBpbiBnbGliYy4KCk5vdCBldmVyeXRoaW5nIGluIEFWWC01MTIgaGFzIGhpZ2ggcG93
ZXIgY29uc3VtcHRpb24gb24gcmVsZXZhbnQgQ1BVcy4KRnVydGhlcm1vcmUsIHRoZSBleHRyYSBy
ZWdpc3RlcnMgdGhhdCBkb24ndCBuZWVkIFZaRVJPVVBQRVIgaGVscCB1cyB0bwphdm9pZCB0cmFu
c2FjdGlvbnMgYWJvcnRzIGluIFJUTSBtb2RlLiAgSWYgd2UgaGFkIHRvIGVuYWJsZSBBVlgtNTEy
CmV4cGxpY2l0bHkgaW4gZXZlcnkgcHJvY2VzcywgSSdtIG5vdCBzdXJlIGlmIHdlIHdvdWxkIGJl
IHVzaW5nIGl0IHRvZGF5LgpUaGUgY29tcGxpY2F0ZWQgY2hvaWNlcyBhcm91bmQgQVZYLTUxMiAo
YW5kIEFWWDIgZm9yIGVhcmxpZXIgQ1BVcykKYXJlbid0IHBhcnRpY3VsYXJseSB1bmlxdWUuICBU
aGVzZSBmdW5jdGlvbnMgaGF2ZSBkaWZmZXJlbnQgdHJhZGUtb2Zmcwoob3B0aW1pemluZyBmb3Ig
c2luZ2xlIHRocmVhZC9zaW5nbGUgcHJvY2VzcyB1c2FnZSB2cyBnbG9iYWwgc3lzdGVtCmJlaGF2
aW9yKSBvbiBvdGhlciBhcmNoaXRlY3R1cmVzLCB0b28uCgo+IFRoZXJlIHdpbGwgbGlrZWx5IGJl
IFYgc3VwcG9ydCBpbiBnbGliYyAoc3RyKi9tZW0qKS4gRm9yIHN5c3RlbXMgdGhhdAo+IHByZWZl
ciBoYXZpbmcgViAiYWx3YXlzLW9uIiwgdGhlIFVYIG9mIHJlcXVpcmluZyBhbGwgYmluYXJpZXMg
dG8KPiBleHBsaWNpdGx5IGNhbGwgcHJjdGwoKSBpcyBub3QgZ3JlYXQgKGFzIEFuZHJldyBwb2lu
dGVkIG91dCBpbiBlYXJsaWVyCj4gcG9zdHMpLiBBIFYga25vYiBiYXNlZCBvbiBzb21lIHN5c3Rl
bSBwb2xpY3kgaW4gY3J0MD8gOi1QCgpJdCB3b3VsZG4ndCBiZSBpbiBjcnQwIChzdGF0aWNhbGx5
IGxpbmtlZCksIGl0IHdvdWxkIGJlIGluIHRoZSBkeW5hbWljCmxvYWRlci4gIFNvIG5vdCBxdWl0
ZSBhcyBiYWQgaWYgcG9saWN5IHJldmlzaW9ucyBhcmUgcmVxdWlyZWQuICBCdXQKZ2xpYmMgaXMg
bm90IHRoZSBvbmx5IHByb3ZpZGVyIG9mIHVzZXJzcGFjZSBzdGFydHVwIGNvZGUsIHNvIGZ1dHVy
ZQp0dW5pbmcgb2YgdXNlcnNwYWNlIHBvbGljeSB3aWxsIHJlbWFpbiBjb21wbGljYXRlZC4KClRo
YW5rcywKRmxvcmlhbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
