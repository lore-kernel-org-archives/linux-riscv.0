Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2EE8C54EBE
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jan 2023 14:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BHZb7nv1e8NWmtrEh8Tlk85vPkas8FvuLejpW/LBW9U=; b=v+2cuD87nX3QNt
	ZHeO9/un6IsuOXyygP2ZdU6RPXT8FuWtaGlo/wCpISP7x6pY420IgMdMZSIafFjqD9TZA1+5+0izI
	eAzbXFgaGJWvW9mbFWUuDZnbUvPZtFepelWHwBA8yp3MwJdFVcjsMvsKeadYhs8IDSNiFdcnHVoZZ
	Dh4zv/3JPNH01A3QVRsPdUbX6E4CiF3wxjamunWZ9U2Y7i/NZnAUA//uLae+q57z+FfEkgOgd3llT
	K/0yY4u6kedn1DmzDlB9ux7H3tzYT2RWfODYRVNNGszZ8xcM5OvjkfFs+vwl8/Bc63KccAdX7Mqei
	iXKCZDO1hM5JQEbMdW1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGLK0-0032Gk-9s; Fri, 13 Jan 2023 14:46:20 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGLJw-0032ES-72
	for linux-riscv@lists.infradead.org; Fri, 13 Jan 2023 14:46:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B9716B820C9;
	Fri, 13 Jan 2023 14:46:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7B87C433D2;
	Fri, 13 Jan 2023 14:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673621173;
	bh=uVNiYN015zOKGYAR63hxg0e1aLPV1U+u9Ab5GMB5AGc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vNB4FYpN1R5PNtOd0/xoHymyzhJfoSvNDyhNH6pomXpBHz6C5FA5rYzkMEgM2qolb
	 PP3FcgRXKYfCReSGva3gI983FKqej3Y3C16Lq71ULLpXFZTqds0vPVPwckIp/oGRC/
	 Tc06UIHS4zVhWoWLu/oZ1ppLnvAISGUdi1rNvJ4aK4XKKAa+r8+SWg9TaQx7ZFg789
	 QWagfHjInlSw+xruSyI9Fsfdo0uVi/99jSR+yJDgTtEsWeLh4Z67btkwlapRRZlx9X
	 i4WEam9AWc6O79NFg+yi9QpxuCXSt8gefltBDwjxl37y4sLrQiq2yTGL5pjykZRNkZ
	 DspERoJ/E7rqw==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] scripts/decodecode: Add support for RISC-V
Date: Fri, 13 Jan 2023 15:45:52 +0100
Message-Id: <20230113144552.138081-3-bjorn@kernel.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230113144552.138081-1-bjorn@kernel.org>
References: <20230113144552.138081-1-bjorn@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_064616_609757_49F80D22 
X-CRM114-Status: GOOD (  13.26  )
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

RnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKUklTQy1WIGhhcyBzb21l
IEdOVSBkaXNhc3NlbWJseSBxdWlya3MsIGUuZy4gaXQgcmVxdWlyZXMgJy1EJyB0bwpwcm9wZXJs
eSBkaXNhc3NlbWJsZSAuYnl0ZSBkaXJlY3RpdmVzIHNpbWlsYXIgdG8gQXJtIFsxXS4gRnVydGhl
ciwgR05VCm9iamR1bXAgZ3JvdXBzIFJJU0MtViBpbnN0cnVjdGlvbiBieSAyIG9yIDQgYnl0ZSBj
aHVua3MsIGluc3RlYWQgZG9pbmcKYnl0ZS1mb3ItYnl0ZS4KCkFkZCB0aGUgcmVxdWlyZWQgc3dp
dGNoZXMsIGFuZCB0cmFuc2xhdGUgZnJvbSBzaG9ydC93b3JkIHRvIGJ5dGVzIHdoZW4KQVJDSCBp
cyAicmlzY3YiLgoKQW4gZXhhbXBsZSBob3cgdG8gaW52b2tlIGRlY29kZWNvZGUgZm9yIFJJU0Mt
VjoKICAkIGVjaG8gJ0NvZGU6IDY0IGM5IDI5IGEwIDE3IGQ0IDFmIDAxIDEzIDA0IDQ0CiAgYjgg
OTMgOTIgMzggMDAgMTYgOTQgMDAgNjAgPDAyPiA5NCBhYSBlOCcgfCAgXAogIEFGTEFHUz0iLW1h
cmNoPXJ2NjRpbWFjX3ppY2JvbV96aWhpbnRwYXVzZSIgIFwKICBBUkNIPXJpc2N2IENST1NTX0NP
TVBJTEU9cmlzY3Y2NC1saW51eC1nbnUtIC4vc2NyaXB0cy9kZWNvZGVjb2RlCiAgQ29kZTogNjQg
YzkgMjkgYTAgMTcgZDQgMWYgMDEgMTMgMDQgNDQgYjggOTMgOTIgMzggMDAgMTYgOTQgMDAgNjAg
PDAyPiA5NCBhYSBlOAogIEFsbCBjb2RlCiAgPT09PT09PT0KICAgICAwOiAgIGM5NjQgICAgICAg
ICAgICAgICAgICAgIGMuc3cgICAgczEsODQoYTApCiAgICAgMjogICBhMDI5ICAgICAgICAgICAg
ICAgICAgICBjLmogICAgIGMgPC50ZXh0KzB4Yz4KICAgICA0OiAgIDAxMWZkNDE3ICAgICAgICAg
ICAgICAgIGF1aXBjICAgczAsMHgxMWZkCiAgICAgODogICBiODQ0MDQxMyAgICAgICAgICAgICAg
ICBhZGRpICAgIHMwLHMwLC0xMTQ4ICMgMTFmY2I4OCA8LnRleHQrMHgxMWZjYjg4PgogICAgIGM6
ICAgMDAzODkyOTMgICAgICAgICAgICAgICAgc2xsaSAgICB0MCxhNywweDMKICAgIDEwOiAgIDk0
MTYgICAgICAgICAgICAgICAgICAgIGMuYWRkICAgczAsdDAKICAgIDEyOiAgIDYwMDAgICAgICAg
ICAgICAgICAgICAgIGMubGQgICAgczAsMChzMCkKICAgIDE0OiogIDk0MDIgICAgICAgICAgICAg
ICAgICAgIGMuamFsciAgczAgICAgICAgICAgICAgIDwtLSB0cmFwcGluZyBpbnN0cnVjdGlvbgog
ICAgMTY6ICAgZThhYSAgICAgICAgICAgICAgICAgICAgYy5zZHNwICBhMCw4MChzcCkKCiAgQ29k
ZSBzdGFydGluZyB3aXRoIHRoZSBmYXVsdGluZyBpbnN0cnVjdGlvbgogID09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KICAgICAwOiAgIDk0MDIgICAgICAgICAgICAg
ICAgICAgIGMuamFsciAgczAKICAgICAyOiAgIGU4YWEgICAgICAgICAgICAgICAgICAgIGMuc2Rz
cCAgYTAsODAoc3ApCgpbMV0gaHR0cHM6Ly9zb3VyY2V3YXJlLm9yZy9idWd6aWxsYS9zaG93X2J1
Zy5jZ2k/aWQ9MTAyNjMKClNpZ25lZC1vZmYtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9z
aW5jLmNvbT4KLS0tCiBzY3JpcHRzL2RlY29kZWNvZGUgfCAxMiArKysrKysrKysrKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
c2NyaXB0cy9kZWNvZGVjb2RlIGIvc2NyaXB0cy9kZWNvZGVjb2RlCmluZGV4IGIyOGZkMjY4NjU2
MS4uOGZlNzFjMjkyMzgxIDEwMDc1NQotLS0gYS9zY3JpcHRzL2RlY29kZWNvZGUKKysrIGIvc2Ny
aXB0cy9kZWNvZGVjb2RlCkBAIC05Myw2ICs5MywxMSBAQCBkaXNhcygpIHsKIAkJJHtDUk9TU19D
T01QSUxFfXN0cmlwICR0Lm8KIAlmaQogCisJaWYgWyAiJEFSQ0giID0gInJpc2N2IiBdOyB0aGVu
CisJCU9CSkRVTVBGTEFHUz0iLU0gbm8tYWxpYXNlcyAtLXNlY3Rpb249LnRleHQgLUQiCisJCSR7
Q1JPU1NfQ09NUElMRX1zdHJpcCAkdC5vCisJZmkKKwogCWlmIFsgJHBjX3N1YiAtbmUgMCBdOyB0
aGVuCiAJCWlmIFsgJFBDIF07IHRoZW4KIAkJCWFkal92bWE9JCgoICRQQyAtICRwY19zdWIgKSkK
QEAgLTEyNiw4ICsxMzEsMTMgQEAgZ2V0X3N1YnN0cl9vcGNvZGVfYnl0ZXNfbnVtKCkKIAlkbwog
CQlzdWJzdHIrPSIkb3BjIgogCisJCW9wY29kZT0iJHN1YnN0ciIKKwkJaWYgWyAiJEFSQ0giID0g
InJpc2N2IiBdOyB0aGVuCisJCQlvcGNvZGU9JChlY2hvICRvcGNvZGUgfCB0ciAnICcgJ1xuJyB8
IHRhYyB8IHRyIC1kICdcbicpCisJCWZpCisKIAkJIyByZXR1cm4gaWYgb3Bjb2RlIGJ5dGVzIGRv
IG5vdCBtYXRjaCBAb3BsaW5lIGFueW1vcmUKLQkJaWYgISBlY2hvICRvcGxpbmUgfCBncmVwIC1x
ICIkc3Vic3RyIjsKKwkJaWYgISBlY2hvICRvcGxpbmUgfCBncmVwIC1xICIkb3Bjb2RlIjsKIAkJ
dGhlbgogCQkJYnJlYWsKIAkJZmkKLS0gCjIuMzcuMgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
