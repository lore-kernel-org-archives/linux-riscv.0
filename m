Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8322ECD4F54
	for <linux-riscv@archiver.kernel.org>; Wed, 20 May 2026 23:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0u5hV77kSiAQdhBZ/7JTk55zeSgrRdS0ma7lad0odD8=; b=h1U4Tutovwyu6E
	a/5eB9V2edYA0eUwy2M7Ym3LGo8iW2MJ7RTHLIvtrAHvopKfcVMCN7nqd3379aY60DHLvTXJs3B8p
	1uxzBbeJrt+xLu1C7GIHHHjIjRSCH6aB9lK8NQ3xaERDjQWjHb3H3CE7lZEkaqs6i7F1LZz29VbOC
	9FBofnNHqXvsmetR7qDh4A4qxwGeirjlAHeMSJx2ps+a15Vot1ut3kKuqurjPcY56ayzYGT19/Tp2
	hi+/Ts99Emxtb68t/RAu9KWqLTw/1k+eJSVnasL/1DWJRiRP9eQHxXxMMg19tPC/6Om7rYKnn4lLW
	mn40RIbRjqxjeczfDt5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPqbn-00000006Ba3-21Pm;
	Wed, 20 May 2026 23:45:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPqbl-00000006BZo-3StS
	for linux-riscv@lists.infradead.org;
	Wed, 20 May 2026 23:45:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1FC9F60098;
	Wed, 20 May 2026 23:45:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 804881F000E9;
	Wed, 20 May 2026 23:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779320748;
	bh=jiTv5n3ujX7ACkkUTLe3Pwwy8YmjGp/zXCjXgG0+tAg=;
	h=From:Subject:Date:To:Cc;
	b=f3tF3hLn22+qevBDqRbh6nB1lv0hRlEQ9l2TaI2CUe3Gwu55CscfItiqyRlkrJmxK
	 PGyUILv2EE8HSL+GXmrPwZcX8d00U55uEOcPupYRTfAHL4XFi3171eGi8aRoloEKHc
	 rM22dfaxi38SIUiSuIITUjwiWgku2Z8HTWZLjzkMNCbQ+rHXqNPE3Pmx0fwsKg7A+Z
	 zxB5n2MY4drNj7hqmWJSPabpN+0MqJq3bIYT65qw4jD3rLpBfSCms5qwyPK9vm6w9b
	 kAV0v11aR6qFoGxXh5LzAmq4c3yus8pd8AuoHoJxFJFOHuXU9GoPhtNtt5mO+8G6KB
	 x0BmSxZ0bL5Fg==
From: Yixun Lan <dlan@kernel.org>
Subject: [PATCH v2 0/2] spacemit: k3: Add support for CoM260-IFX board
Date: Wed, 20 May 2026 23:45:26 +0000
Message-Id: <20260520-02-k3-com260-ifx-v2-0-d55095457cf0@kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJZHDmoC/2WNyw6CMBBFf4XM2jHTYnm48j8MCx4DVLQ1LRIM4
 d8t6M7lSc49dwHPTrOHc7SA40l7bU0AeYig7kvTMeomMEiSCSmRI0kcYqztIzDqdsayjCVVOXG
 iUgizp+NWz3vyWnzZv6ob1+PW2Yxe+9G69/45ic375SX95yeBhDGLlJRqmlOWXQZ2hu9H6zoo1
 nX9AAfntvrDAAAA
X-Change-ID: 20260519-02-k3-com260-ifx-aa320b90e657
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Yixun Lan <dlan@kernel.org>, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1345; i=dlan@kernel.org;
 h=from:subject:message-id; bh=mfu4IvSdZnvFP+/bTmA+E/QlsPrVl5Rf9/lgIeSbnaY=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBqDkegMJ/sECeDk7ns8h3eMW2CcEdN/X/rVChgb
 v80U3FlCvWJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCag5HoBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+0XKg/9HTQ0sqcGUAB612h8m0Vzpf68WCLCJ/F9vQJNFO8zWUUPAH1J8N79q
 9Z66DJiENBNokcEox1Y4kC2ENF6Mh5jPBBBx1NCwXsfZy2YBx3r+IL4mcsQlHdasgkMhzASwECQ
 yLw9ieFzjr7TPfh9jPKJ13vnijmjY9xBwMTWEBaOgc4pVAjee8FyuwwRqMuNwvEVplvlsFwM2+l
 FThqLnLEPX4iNzKZ2wDJFjU61y0o6vgSXX4+mk8iUViAeXN8yP0YEO2FBrU5hldsjOJJnaMOYwO
 02ZkuqPOJllHolAgwHb7VOWAPR2K8TirmJRsm5DxnkIEFP2NUm7leso22C/ji9tGrA8aUsQfFu2
 Dk/EZOe3pjpGOf/MZTQUU/RdKO/xDycdiT7R5N22UwBwsOJITNnCOnJxUm8edtEHI8Ex47rZCxn
 yHtOLFbe/FasfNtsgOXH9w66/9ipSh0tnLX4awEMTkAAQsge/qY+3pcJ6gT7eJ0ibYwHBVgAGWo
 0ain+fTMt2yiUZ/kfqSozhhzyPBvtI83JC5hGgho9p6RtJEum24EKIvDghsiX7ezxveHrlvxf61
 9TgUmudtsdiaWyFFkeCLF7mrtcIlp1fU3/Om0WtpUys9Akbacrd79OxyRhyv8oeHsNu2u9r5qV6
 +W7ScPX3QhNdZLgGjHIvumC5mbe+L0=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
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

VGhpcyBwYXRjaCBzZXJpZXMgdHJ5IHRvIGFkZCBpbml0aWFsIHN1cHBvcnQgZm9yIFNwYWNlbWlU
IEszIENvTTI2MC1JRlgKYm9hcmQgd2hpY2ggY29tYmluZXMgYSA2OS42IMOXIDQ1IG1tIGNvbXB1
dGUgbW9kdWxlIHdpdGggYSByZWZlcmVuY2UgY2Fycmllcgpib2FyZC4KClRoZSBmaXJzdCBwYXRj
aCBpbnRyb2R1Y2UgbmV3IGR0IGJpbmRpbmdzIGZvciB0aGUgbW9kdWxlIGFuZCBib2FyZCwgdGhl
CnNlY29uZCBwYXRjaCBlbmFibGUgc3VwcG9ydCBmb3Igc2VyaWFsIGNvbnNvbGUgYW5kIGV0aGVy
bmV0LgoKTGluazogaHR0cHM6Ly9zcGFjZW1pdC5jb20vY29tbXVuaXR5L2RvY3VtZW50L2luZm8/
bGFuZz16aCZub2RlcGF0aD1oYXJkd2FyZS9lY28vazNfY29tMjYwL3Jvb3Rfb3ZlcnZpZXcubWQK
U2lnbmVkLW9mZi1ieTogWWl4dW4gTGFuIDxkbGFuQGtlcm5lbC5vcmc+Ci0tLQpDaGFuZ2VzIGlu
IHYyOgotIGNvbGxlY3QgdGFncwotIHJlbmFtZSB0byBtb3JlIGdlbmVyaWMgbmFtZSBmb3IgUE1J
QyBub2RlCi0gYWxpZ24gcGluY3RybCBuYW1lIGZvciBnbWFjCi0gTGluayB0byB2MTogaHR0cHM6
Ly9wYXRjaC5tc2dpZC5saW5rLzIwMjYwNTIwLTAyLWszLWNvbTI2MC1pZngtdjEtMC0zZTE3MDU1
ZGQ0ODhAa2VybmVsLm9yZwoKLS0tCllpeHVuIExhbiAoMik6CiAgICAgIGR0LWJpbmRpbmdzOiBy
aXNjdjogc3BhY2VtaXQ6IEFkZCBLMyBDb00yNjAtSUZYIGJvYXJkCiAgICAgIHJpc2N2OiBkdHM6
IHNwYWNlbWl0OiBrMzogSW5pdGlhbCBzdXBwb3J0IGZvciBDb00yNjAtSUZYIGJvYXJkCgogLi4u
L2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3Yvc3BhY2VtaXQueWFtbCAgICAgICAgfCAgIDUgKwog
YXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9NYWtlZmlsZSAgICAgICAgICAgICAgfCAgIDEg
KwogYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMy1jb20yNjAtaWZ4LmR0cyAgICAgfCAg
MjEgKysrCiBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2szLWNvbTI2MC5kdHNpICAgICAg
ICB8IDE5MCArKysrKysrKysrKysrKysrKysrKysKIGFyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2Vt
aXQvazMtcGluY3RybC5kdHNpICAgICAgIHwgIDMzICsrKysKIDUgZmlsZXMgY2hhbmdlZCwgMjUw
IGluc2VydGlvbnMoKykKLS0tCmJhc2UtY29tbWl0OiBlMjUxOGU4Y2IxZGRlNjRhZjJkMWJiMjQ2
NjM5YmI3ZWY3NTIzZjdhCmNoYW5nZS1pZDogMjAyNjA1MTktMDItazMtY29tMjYwLWlmeC1hYTMy
MGI5MGU2NTcKCkJlc3QgcmVnYXJkcywKLS0gIApZaXh1biBMYW4gPGRsYW5Aa2VybmVsLm9yZz4K
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
