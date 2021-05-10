Return-Path: <SRS0=SpZ8=KF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83308C433ED
	for <linux-riscv@archiver.kernel.org>; Mon, 10 May 2021 10:33:20 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D07C06198E
	for <linux-riscv@archiver.kernel.org>; Mon, 10 May 2021 10:33:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D07C06198E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hLOiJWiQCXfwYYNnUoUvWXUY3UerOokB5biuzZ/Iu4U=; b=Kj0a7UVXO3iKz4PsqIqUuYo4F
	YRsszLxsTXuNig+HbkmEvsheu0/0bHpi63Z0lqMHxs+9zqYIewB7NkmmebzjVK3XsVgFN78370g6R
	mfuvypOu16Z0fnQ7w+tcg99db9lPrdD8g63Bch78OI+x5WR2fIXyLHNVdbbe9RaRagTjZBJhPtMnA
	W66dMyRyCwLWqraAcgwQzSCOPnyejQMmAGEy0liX1HAJlNdbYEkGBI+gNRgPm5Xap7v9Vj2bennwT
	hPuLFg5YrlLd9MlL3uLsnruur5+FD1J6xVYIMOntI09bEkGRiNIFIlc/xqVKfBc4DsYXIZt6Z0tWB
	HAPmstOhw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg3Dk-00Dwuk-Ks; Mon, 10 May 2021 10:33:04 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg38L-00DvsA-Ok
 for linux-riscv@desiato.infradead.org; Mon, 10 May 2021 10:27:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Reply-To:Content-ID:Content-Description;
 bh=J2amZxK4lRnufxK4Coixb+kY+N5O2I1wBVJbZZH+8Nc=; b=wP6iRaFXDb8k+rDFWwHkkfsMYV
 HN0L3RNJ/VOpJ6yU3btj9lY3CbbbZM7mkMPez01XyjhCmGCDJ3XqwacWzF6Y5sH/NJlRF+Ut0t9r+
 qGU5LiuTpc6xTgmpPJQ7OjCCUCBSSFl/8SRNcOE0IKFT/VX+ved436kKYANjYxWFNEojWby2lQEpP
 2JiDM/TjTA4fYHAbdpxdvG+82xGnZgsHA9qwSLHG94ACTt00dx6r4y6/oLfGtziwPd3n+Tc/7wlNC
 q/CjPbcfxnwrXOkSTBxo54x0oNwAvwjHVdKBoZH2OrIYiCpEud7PiBpGMYix6iluhr8zkHEKULplp
 6LmfQ2KQ==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg38H-008Wsv-6B
 for linux-riscv@lists.infradead.org; Mon, 10 May 2021 10:27:28 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id EBDF56192D;
 Mon, 10 May 2021 10:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620642444;
 bh=1pGsLkW90Hkv2TIwTQmqfigD/Ezq8Ys098ssjaqakVU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YBYtzJpJ/BKC79x9zApyNZgnF0mVm+qYeRZ33rfwMX7E+ddHqqyqLarw45XiuaNFv
 +SUld8LGfHOsp3V1VOxVlEcLNbJC7Mg4IeKfRSRPF+tOMdlp6UVF9fSKggfsyaqQm1
 h3Dj1PeFWDx3v6KaExWLT4837Jb/pZcUSp0WFba4kPR756AOH5Lw5fulLf8AbQFWjy
 kWCBPzoDT6taDyHL6L+p8h9yqqEc+t4EYcJkX3wMVBooYrxjdgUI342EYNhQMRIMyX
 qSZFJI6xMzyEc4MtM6n3V4XEBTUKNSxOWfOSYo4yQx2pf2USsNqclcLMo2AC85O6i0
 IO+SHgA4D1gRw==
Received: by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1lg38D-000UQS-Ui; Mon, 10 May 2021 12:27:21 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 "Jonathan Corbet" <corbet@lwn.net>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH 33/53] docs: riscv: vm-layout.rst: avoid using UTF-8 chars
Date: Mon, 10 May 2021 12:26:45 +0200
Message-Id: <050eb90d1cfe167f6cc2e25608d825c18aa7c559.1620641727.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620641727.git.mchehab+huawei@kernel.org>
References: <cover.1620641727.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_032725_276303_319D47FD 
X-CRM114-Status: GOOD (  11.12  )
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

V2hpbGUgVVRGLTggY2hhcmFjdGVycyBjYW4gYmUgdXNlZCBhdCB0aGUgTGludXggZG9jdW1lbnRh
dGlvbiwKdGhlIGJlc3QgaXMgdG8gdXNlIHRoZW0gb25seSB3aGVuIEFTQ0lJIGRvZXNuJ3Qgb2Zm
ZXIgYSBnb29kIHJlcGxhY2VtZW50LgpTbywgcmVwbGFjZSB0aGUgb2NjdXJlbmNlcyBvZiB0aGUg
Zm9sbG93aW5nIFVURi04IGNoYXJhY3RlcnM6CgoJLSBVKzIwMTMgKCfigJMnKTogRU4gREFTSAoK
U2lnbmVkLW9mZi1ieTogTWF1cm8gQ2FydmFsaG8gQ2hlaGFiIDxtY2hlaGFiK2h1YXdlaUBrZXJu
ZWwub3JnPgotLS0KIERvY3VtZW50YXRpb24vcmlzY3Yvdm0tbGF5b3V0LnJzdCB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBh
L0RvY3VtZW50YXRpb24vcmlzY3Yvdm0tbGF5b3V0LnJzdCBiL0RvY3VtZW50YXRpb24vcmlzY3Yv
dm0tbGF5b3V0LnJzdAppbmRleCAzMjlkMzIwOThhZjQuLjU0NWY4YWI1MWYxYSAxMDA2NDQKLS0t
IGEvRG9jdW1lbnRhdGlvbi9yaXNjdi92bS1sYXlvdXQucnN0CisrKyBiL0RvY3VtZW50YXRpb24v
cmlzY3Yvdm0tbGF5b3V0LnJzdApAQCAtMjIsNyArMjIsNyBAQCBSSVNDLVYgTGludXggS2VybmVs
IDY0Yml0CiA9PT09PT09PT09PT09PT09PT09PT09PT09CiAKIFRoZSBSSVNDLVYgcHJpdmlsZWdl
ZCBhcmNoaXRlY3R1cmUgZG9jdW1lbnQgc3RhdGVzIHRoYXQgdGhlIDY0Yml0IGFkZHJlc3Nlcwot
Im11c3QgaGF2ZSBiaXRzIDYz4oCTNDggYWxsIGVxdWFsIHRvIGJpdCA0Nywgb3IgZWxzZSBhIHBh
Z2UtZmF1bHQgZXhjZXB0aW9uIHdpbGwKKyJtdXN0IGhhdmUgYml0cyA2My00OCBhbGwgZXF1YWwg
dG8gYml0IDQ3LCBvciBlbHNlIGEgcGFnZS1mYXVsdCBleGNlcHRpb24gd2lsbAogb2NjdXIuIjog
dGhhdCBzcGxpdHMgdGhlIHZpcnR1YWwgYWRkcmVzcyBzcGFjZSBpbnRvIDIgaGFsdmVzIHNlcGFy
YXRlZCBieSBhIHZlcnkKIGJpZyBob2xlLCB0aGUgbG93ZXIgaGFsZiBpcyB3aGVyZSB0aGUgdXNl
cnNwYWNlIHJlc2lkZXMsIHRoZSB1cHBlciBoYWxmIGlzIHdoZXJlCiB0aGUgUklTQy1WIExpbnV4
IEtlcm5lbCByZXNpZGVzLgotLSAKMi4zMC4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
