Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C10C5C3DA6F
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Aug 2023 10:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BXdA2Tu/8V9fmpPxhgZAD3yvlzCV2OjHJb1O9j9ukeA=; b=zyjmBBt+DqNHy5
	51UDaqoX4foZ4iHgNyugmLKxbjrU64lbtWSM1ZgNgjUnj1isE3xepR28PfGBosYKhVEzf7OXfyjQK
	wE6c2lP06pea1IZ4cr0xQ04uPD1CgyXS4IQHAA9G+hGtghl3wEkwuV1I4nf+DpzFH/lzk1G8h55HL
	P5x/MYRYBjNVAPk75L4sp2NNyFdjWrogWptUVOoXMSVexGoEIS7nGC/TYhS1Ha+Ga+u89xPj2lRwB
	p+SAMoKr6aVPm6g5RNfpoQK3/RIUlC4RP0LAXT14Xk9o+7d3ud5DWOzZOyiexBSGlEoWC60tVlgKr
	LzStFinGUeVn0+VAK02w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZU7e-004pJA-2E;
	Fri, 25 Aug 2023 10:32:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZU7b-004pIL-1t
	for linux-riscv@lists.infradead.org;
	Fri, 25 Aug 2023 10:32:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A91DB65F0D
	for <linux-riscv@lists.infradead.org>; Fri, 25 Aug 2023 10:32:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA3AEC433C7;
	Fri, 25 Aug 2023 10:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692959574;
	bh=rJmtd4AoEg8qpdbmr/J69QEcfU7pcYSpKFVRCPpe/Js=;
	h=From:To:Cc:Subject:Date:From;
	b=BM+GM9bM9SM9xPdQtUlBM7AAgc3ZWcfCiaIOW9UuluA2QM9JovGZZUS3tdJo+sAVu
	 hChGeOTU4Ofk1bb+b7DQ9TKqEdI2J+afOXf7am2Ot0faMuJoGmxEiGrXgPlrxLR0Gp
	 dPtH1QvH1hKdm0ksS24UjB9fSaGXiJ/9BpXPZK0mo3PtquOoOdy3GN7DUbO+GCDJ1X
	 lPjGuPABMUr+7fldXVE7pvDl6zGyiVX3WniB9vmNR9exnR6WBq7b5ecErqPncwdFuA
	 hPLfvN1yRyu0g7B6MLmgHXEA648PSJeNsMi3OWoMDBAoVyBAiL5O4VTRromBGclSX/
	 78RcaqV96ryiQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: bpf@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Subject: WARNING: CPU: 3 PID: 261 at kernel/bpf/memalloc.c:342
Date: Fri, 25 Aug 2023 12:32:51 +0200
Message-ID: <87jztjmmy4.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_033255_681147_563C2C23 
X-CRM114-Status: UNSURE (   6.31  )
X-CRM114-Notice: Please train this message.
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

SSdtIGNoYXNpbmcgYSB3b3JrcXVldWUgaGFuZyBvbiBSSVNDLVYvcWVtdSAoVENHKSwgdXNpbmcg
dGhlIGJwZgpzZWxmdGVzdHMgb24gYnBmLW5leHQgOWUzYjQ3YWJlYjhmLgoKSSdtIGFibGUgdG8g
cmVwcm9kdWNlIHRoZSBoYW5nIGJ5IG11bHRpcGxlIHJ1bnMgb2Y6CiB8IC4vdGVzdF9wcm9ncyAt
YSBsaW5rX2FwaSAtYSBsaW5rZWRfbGlzdApJJ20gY3VycmVudGx5IGludmVzdGlnYXRpbmcgdGhh
dC4KCkJ1dCEgU29tZXRpbWVzIChldmVyeSBibHVlIG1vb24pIEkgZ2V0IGEgd2Fybl9vbl9vbmNl
IGhpdDoKIHwgLS0tLS0tLS0tLS0tWyBjdXQgaGVyZSBdLS0tLS0tLS0tLS0tCiB8IFdBUk5JTkc6
IENQVTogMyBQSUQ6IDI2MSBhdCBrZXJuZWwvYnBmL21lbWFsbG9jLmM6MzQyIGJwZl9tZW1fcmVm
aWxsKzB4MWZjLzB4MjA2CiB8IE1vZHVsZXMgbGlua2VkIGluOiBicGZfdGVzdG1vZChPRSkKIHwg
Q1BVOiAzIFBJRDogMjYxIENvbW06IHRlc3RfcHJvZ3MtY3B1diBUYWludGVkOiBHICAgICAgICAg
ICBPRSAgICBOIDYuNS4wLXJjNS0wMTc0My1nZGNiMTUyYmI4MzI4ICMyCiB8IEhhcmR3YXJlIG5h
bWU6IHJpc2N2LXZpcnRpbyxxZW11IChEVCkKIHwgZXBjIDogYnBmX21lbV9yZWZpbGwrMHgxZmMv
MHgyMDYKIHwgIHJhIDogaXJxX3dvcmtfc2luZ2xlKzB4NjgvMHg3MAogfCBlcGMgOiBmZmZmZmZm
ZjgwMWIxYmM0IHJhIDogZmZmZmZmZmY4MDE1ZmU4NCBzcCA6IGZmMjAwMDAwMDAwMWJlMjAKIHwg
IGdwIDogZmZmZmZmZmY4MmQyNjEzOCB0cCA6IGZmNjAwMDAwODQ3N2E4MDAgdDAgOiAwMDAwMDAw
MDAwMDQ2NjAwCiB8ICB0MSA6IGZmZmZmZmZmODEyYjZkZGMgdDIgOiAwMDAwMDAwMDAwMDAwMDAw
IHMwIDogZmYyMDAwMDAwMDAxYmU3MAogfCAgczEgOiBmZjVmZmZmZmZmZmU4OTk4IGEwIDogZmY1
ZmZmZmZmZmZlODk5OCBhMSA6IGZmNjAwMDAzZmVmNGIwMDAKIHwgIGEyIDogMDAwMDAwMDAwMDAw
MDAzZiBhMyA6IGZmZmZmZmZmODAwMDgyNTAgYTQgOiAwMDAwMDAwMDAwMDAwMDYwCiB8ICBhNSA6
IDAwMDAwMDAwMDAwMDAwODAgYTYgOiAwMDAwMDAwMDAwMDAwMDAwIGE3IDogMDAwMDAwMDAwMDcz
NTA0OQogfCAgczIgOiBmZjVmZmZmZmZmZmU4OTk4IHMzIDogMDAwMDAwMDAwMDAwMDAyMiBzNCA6
IDAwMDAwMDAwMDAwMDEwMDAKIHwgIHM1IDogMDAwMDAwMDAwMDAwMDAwNyBzNiA6IGZmNWZmZmZm
ZmZmZTg1NzAgczcgOiBmZmZmZmZmZjgyZDZiZDMwCiB8ICBzOCA6IDAwMDAwMDAwMDAwMDAwM2Yg
czkgOiBmZmZmZmZmZjgyZDJjNWU4IHMxMDogMDAwMDAwMDAwMDAwZmZmZgogfCAgczExOiBmZmZm
ZmZmZjgyZDJjNWQ4IHQzIDogZmZmZmZmZmY4MWVhOGYyOCB0NCA6IDAwMDAwMDAwMDAwMDAwMDAK
IHwgIHQ1IDogZmY2MDAwMDA4ZmQyODI3OCB0NiA6IDAwMDAwMDAwMDAwNDAwMDAKIHwgc3RhdHVz
OiAwMDAwMDAwMjAwMDAwMTAwIGJhZGFkZHI6IDAwMDAwMDAwMDAwMDAwMDAgY2F1c2U6IDAwMDAw
MDAwMDAwMDAwMDMKIHwgWzxmZmZmZmZmZjgwMWIxYmM0Pl0gYnBmX21lbV9yZWZpbGwrMHgxZmMv
MHgyMDYKIHwgWzxmZmZmZmZmZjgwMTVmZTg0Pl0gaXJxX3dvcmtfc2luZ2xlKzB4NjgvMHg3MAog
fCBbPGZmZmZmZmZmODAxNWZlYjQ+XSBpcnFfd29ya19ydW5fbGlzdCsweDI4LzB4MzYKIHwgWzxm
ZmZmZmZmZjgwMTVmZWZhPl0gaXJxX3dvcmtfcnVuKzB4MzgvMHg2NgogfCBbPGZmZmZmZmZmODAw
MDgyOGE+XSBoYW5kbGVfSVBJKzB4M2EvMHhiNAogfCBbPGZmZmZmZmZmODAwYTVjM2E+XSBoYW5k
bGVfcGVyY3B1X2RldmlkX2lycSsweGE0LzB4MWY4CiB8IFs8ZmZmZmZmZmY4MDA5ZmFmYT5dIGdl
bmVyaWNfaGFuZGxlX2RvbWFpbl9pcnErMHgyOC8weDM2CiB8IFs8ZmZmZmZmZmY4MDBhZTU3MD5d
IGlwaV9tdXhfcHJvY2VzcysweGFjLzB4ZmEKIHwgWzxmZmZmZmZmZjgwMDBhOGVhPl0gc2JpX2lw
aV9oYW5kbGUrMHgyZS8weDg4CiB8IFs8ZmZmZmZmZmY4MDA5ZmFmYT5dIGdlbmVyaWNfaGFuZGxl
X2RvbWFpbl9pcnErMHgyOC8weDM2CiB8IFs8ZmZmZmZmZmY4MDdlZTcwZT5dIHJpc2N2X2ludGNf
aXJxKzB4MzYvMHg0ZQogfCBbPGZmZmZmZmZmODEyYjVkM2E+XSBoYW5kbGVfcmlzY3ZfaXJxKzB4
NTQvMHg4NgogfCBbPGZmZmZmZmZmODEyYjY5MDQ+XSBkb19pcnErMHg2Ni8weDk4CiB8IC0tLVsg
ZW5kIHRyYWNlIDAwMDAwMDAwMDAwMDAwMDAgXS0tLQoKQ29kZToKIHwgc3RhdGljIHZvaWQgZnJl
ZV9idWxrKHN0cnVjdCBicGZfbWVtX2NhY2hlICpjKQogfCB7CiB8IAlzdHJ1Y3QgYnBmX21lbV9j
YWNoZSAqdGd0ID0gYy0+dGd0OwogfCAJc3RydWN0IGxsaXN0X25vZGUgKmxsbm9kZSwgKnQ7CiB8
IAl1bnNpZ25lZCBsb25nIGZsYWdzOwogfCAJaW50IGNudDsKIHwgCiB8IAlXQVJOX09OX09OQ0Uo
dGd0LT51bml0X3NpemUgIT0gYy0+dW5pdF9zaXplKTsKIHwgLi4uCgpJJ20gbm90IHdlbGwgdmVy
c2VkIGluIHRoZSBtZW1vcnkgYWxsb2NhdG9yOyBCZWZvcmUgSSBkaXZlIGludG8gaXQgLS0KaGFz
IGFueW9uZSBlbHNlIGhpdCBpdD8gSWRlYXMgb24gd2h5IHRoZSB3YXJuX29uX29uY2UgaXMgaGl0
PwoKCkJqw7ZybgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
