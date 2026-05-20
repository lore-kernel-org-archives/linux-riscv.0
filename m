Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2EEECD4F3D
	for <linux-riscv@archiver.kernel.org>; Wed, 20 May 2026 23:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cOwFZe/I683MywmZ1KzGTXY6gVH2JYOSfZR6bdaaki0=; b=f8AraYR6l5pt/e
	7gA8Gq3os9n8FbI5UBxSz7B3kSYYTN9bB6bUwsiJ9FoBeFPqjXh22wiO4HY1EUbsq/kbho6f8AbSc
	ZP4mAi4hY/I3Wy9Lhgl5/FlHlUa/XOek+/o2sWyzT15rt05mz241UoWMFod8jjv9LJn2XyxTphbxF
	DWhDhTXbqdDVLKhK2Fz2GUTEv1GuWjSZhwbgBu/Q46QBwS4OuOr590EE8FCIH4M0dDq9b84/SpjKo
	PaJu7A+OSrIksOsabxFW80gt9vUZOkyUd0QphQvld2/GDc+DLuGenJZdnQwaMBAmwDK2XPF5E4d6N
	wGxAM6k4tY6LBk0R6DXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPqbq-00000006Bb4-2Mvi;
	Wed, 20 May 2026 23:45:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPqbo-00000006BaC-2614
	for linux-riscv@lists.infradead.org;
	Wed, 20 May 2026 23:45:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A897943620;
	Wed, 20 May 2026 23:45:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F3041F00A39;
	Wed, 20 May 2026 23:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779320751;
	bh=cnpf5Il9CjR5HVNLrhTtw0QsBFfp3NOZahsesj77WKc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=h9qrG2tXWhMEhHc0vffrVG19A2qdDNdp2O3pHG/KBgdC933PmKYi/T5CJj7Fv75UZ
	 oGKIBo1F+fJ1tcakqGD8WlrwKolUWF9mjF9/KFJaRqBSA4SEXWMMDj+ekgA/Z4YvVP
	 wzto19oX967QSjXVBEF7TmdL36s5aHcsOASnCLDuRwbXd1hAGpfc7cOTRL62gIQz3o
	 2MgV572XM87QR4XdV/xIWY4aR+7iPLG3YBgee4h1i7ZEz3U5Tsi5l30s7DmUFnj99u
	 yrnl9SLz7O0WMBPdayJ2VHfhM8jJIHn8sOPwydopz3nmZjcXgsySMJAlqOx26c+5i/
	 Hha2evEk4I70w==
From: Yixun Lan <dlan@kernel.org>
Date: Wed, 20 May 2026 23:45:27 +0000
Subject: [PATCH v2 1/2] dt-bindings: riscv: spacemit: Add K3 CoM260-IFX
 board
MIME-Version: 1.0
Message-Id: <20260520-02-k3-com260-ifx-v2-1-d55095457cf0@kernel.org>
References: <20260520-02-k3-com260-ifx-v2-0-d55095457cf0@kernel.org>
In-Reply-To: <20260520-02-k3-com260-ifx-v2-0-d55095457cf0@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Yixun Lan <dlan@kernel.org>, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1362; i=dlan@kernel.org;
 h=from:subject:message-id; bh=uPlH8n214swxNWBctvlGwEm7VD7an/rw6fU2GU7t4tA=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBqDkej3kBVQ+xSb1W4oEadJ8PzABe8jCfKZSwGV
 hYTv3ATYQ6JAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCag5HoxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+0SwRAAngN6xpvL4BX+PpAQCBjfDjhaAS0AEjXtSM8d5yMjJe/yweKZ2sg8/
 5l6UsBn46c2pdp72B9pWrvVmS2uPjG34eTKS9QXZMCrTYLXA/lKyKFmX2+RI62I3dd1qyd/O75f
 wUz2tO6/VWvtbMRXmIoMcskWsUJpw+G+hDzEhTd9Q40j69gkIlDh86PQztr0p4BjDR4MNIIhISX
 6lKo/U+ysZT1LzQgUt6tJwefRBoZLsU0W8SUylsK4VB9UCT6G0fyIuMtJIXALJGOn3vXhKO7J+x
 l2DBQ+u7ban1LEka1UztNQvAGoZYvQITF9VxYmdSYSCFAkz3Mkv9zL/vDK8yQeeGbBuJf02HR1s
 qwV5XBexGvwZ2sk2Zu7TDZwh6MjLurExfSmrWw5hpapFyYppW7oireHt86ZZ/vKyVt+P0J0ELQH
 cTZdpUFCFOU3UmgK2e79j8t7/fUYHaBBhdiUPzN+WkyckiHIK0giaoGXxt/7KH44gx+6F529/Cu
 87oMgY2FarZek9VY/XbEvzN0s0D4esUjGmTR5RfXEyLFaRZjCOCWvqFVoeIF1EjswyuP8vA0Ikj
 J7k6WNJzvrXE47o+HQ9DHCO3f3FNlE/CIh94HC3xhh3bArbhyccxd7FHgroC46+9GK9/3oNKMkl
 TmBqTU24lfFjDmjQPKzBET/JKh8Zn0=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_164552_579028_A4EE8D76 
X-CRM114-Status: UNSURE (   7.47  )
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

VGhlIFNwYWNlbWlUIEszIENvTTI2MC1JRlggYm9hcmQgY29tYmluZXMgYSA2OS42IMOXIDQ1IG1t
IGNvbXB1dGUgbW9kdWxlCndpdGggYSByZWZlcmVuY2UgY2FycmllciBib2FyZC4KClRoZSBtb2R1
bGUgaW50ZWdyYXRlcyB1cCB0byAzMkdCIExQRERSNSBtZW1vcnksIFVGUyBzdG9yYWdlLCBNaWNy
byBTRApjYXJkIHNsb3QgYW5kIGluY2x1ZGVzIGludGVyZmFjZXMgc3VjaCBhcyBkdWFsIE1JUEkg
Q1NJLTIgY29ubmVjdG9ycywKTS4yIGV4cGFuc2lvbiwgVVNCIDMuMCwgR2lnYWJpdCBFdGhlcm5l
dCwgRGlzcGxheVBvcnQsIGFuZCBhIDQwLXBpbgpleHBhbnNpb24gaGVhZGVyLgoKVGhlIGNhcnJp
ZXIgYm9hcmQgaXMgaW50ZW5kZWQgYXMgYSBnZW5lcmFsLXB1cnBvc2UgZGV2ZWxvcG1lbnQgcGxh
dGZvcm0KZm9yIENvTTI2MCBtb2R1bGUgYW5kIGV4cG9zZXMgaW50ZXJmYWNlcyBmb3IgYWxsIG9m
IHN0b3JhZ2UsIGRpc3BsYXksCm5ldHdvcmtpbmcsIGFuZCBjYW1lcmEgY29ubmVjdGl2aXR5LgoK
QWNrZWQtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+ClNpZ25l
ZC1vZmYtYnk6IFlpeHVuIExhbiA8ZGxhbkBrZXJuZWwub3JnPgotLS0KIERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9zcGFjZW1pdC55YW1sIHwgNSArKysrKwogMSBmaWxl
IGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9zcGFjZW1pdC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3Jpc2N2L3NwYWNlbWl0LnlhbWwKaW5kZXggYWY4MDMwMjQyYmRjLi4z
MTFiYmNjYmEwYmEgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9yaXNjdi9zcGFjZW1pdC55YW1sCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9yaXNjdi9zcGFjZW1pdC55YW1sCkBAIC0zMiw2ICszMiwxMSBAQCBwcm9wZXJ0aWVzOgog
ICAgICAgICAgICAgICAtIGRlZXBjb21wdXRpbmcsZm1sMTN2MDUKICAgICAgICAgICAgICAgLSBz
cGFjZW1pdCxrMy1waWNvLWl0eAogICAgICAgICAgIC0gY29uc3Q6IHNwYWNlbWl0LGszCisgICAg
ICAtIGl0ZW1zOgorICAgICAgICAgIC0gZW51bToKKyAgICAgICAgICAgICAgLSBzcGFjZW1pdCxr
My1jb20yNjAtaWZ4CisgICAgICAgICAgLSBjb25zdDogc3BhY2VtaXQsazMtY29tMjYwCisgICAg
ICAgICAgLSBjb25zdDogc3BhY2VtaXQsazMKIAogYWRkaXRpb25hbFByb3BlcnRpZXM6IHRydWUK
IAoKLS0gCjIuNTQuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
