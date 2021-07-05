Return-Path: <SRS0=OdZr=L5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 460AAC07E9E
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jul 2021 23:26:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3FF461978
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jul 2021 23:26:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3FF461978
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=etorok.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DlZ2yJZ1zRVw9d7UeNXdjp3lBa7vOQkbEwzK+pYoAaM=; b=MLRCjTkEM1xfuT
	bmz0nqvXqJysu0bRFnz06OQyn9/VTfaHZpOE6l1Go94D/Wf5DYjXEgqYy7DAsc5Zb2Atb4gaG1Jwx
	V6kjMwixXMAZDUhauXzwOS+MMGdvtkFI8YxceQI6I+DKNWRBXZoIQn88oJWz10AZVuUIlK42I+SDt
	KT5YzQG7NKrW96Ea9vybnOFX/RkSVPwrRwQZjqj5ysFV3S19jVPnMfzMbsDSTZG20Eg4+J19fbZxl
	cECxfyKTdaiy1jUYcbBFF65RGmHlfCSv/CR1Vy5M+mSszDpmGP99l4myjQXIopYkLN1/+nbql7lY0
	473dX/bovUIliYlHYWeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0Xyj-00A14e-Na; Mon, 05 Jul 2021 23:26:17 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0Xyg-00A13B-0K
 for linux-riscv@lists.infradead.org; Mon, 05 Jul 2021 23:26:15 +0000
Received: (Authenticated sender: edwin@etorok.net)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 6AA45200003;
 Mon,  5 Jul 2021 23:26:04 +0000 (UTC)
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin@etorok.net>
To: linux-riscv@lists.infradead.org
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin@etorok.net>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Fabian Hemmer <copy@copy.sh>,
 Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@redhat.com>,
 John Garry <john.garry@huawei.com>, Leo Yan <leo.yan@linaro.org>,
 Namhyung Kim <namhyung@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Remi Bernon <rbernon@codeweavers.com>, Rob Herring <robh@kernel.org>,
 linux-perf-users@vger.kernel.org
Subject: [PATCH 0/4] RISC-V: make perf record --call-graph=dwarf work
Date: Tue,  6 Jul 2021 00:25:20 +0100
Message-Id: <20210705232524.4024832-1-edwin@etorok.net>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210705_162614_367551_4A0CC491 
X-CRM114-Status: GOOD (  11.27  )
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

Q3VycmVudGx5IHBlcmYgb24gUklTQy1WIGNhbm5vdCBnYXRoZXIgY2FsbGdyYXBocyB3aGVuIGJ1
aWx0IHdpdGhvdXQgZnJhbWUgcG9pbnRlcnMuCkFmdGVyIHRoaXMgc2VyaWVzIGlzIGFwcGxpZWQs
IGFuZCB1c2luZyBhIHRydW5rIHZlcnNpb24gb2YgT0NhbWwgKHdoaWNoIGVtaXRzIERXQVJGIENG
SSkKSSBjYW4gc3VjY2Vzc2Z1bGx5IGdldCBjYWxsZ3JhcGhzIGZyb20gYW4gT0NhbWwgcHJvZ3Jh
bS4KCk5vdGUgdGhhdCB0aGUgZGVmYXVsdCBjcHUtY3ljbGVzIGV2ZW50IGRvZXNuJ3Qgd29yaywg
YnV0IHRoYXQgaXMgdW5yZWxhdGVkLgoKVGVzdGVkIG9uIEhpRml2ZSBVbm1hdGNoZWQ6CmBgYAog
IyBwZXJmIHJlY29yZCAtLXVzZXItcmVncz0/CmF2YWlsYWJsZSByZWdpc3RlcnM6IHBjIHJhIHNw
IGdwIHRwIHQwIHQxIHQyIHMwIHMxIGEwIGExIGEyIGEzIGE0IGE1IGE2IGE3CiBzMiBzMyBzNCBz
NSBzNiBzNyBzOCBzOSBzMTAgczExIHQzIHQ0IHQ1IHQ2CgogIyBzZWQgLWUgJ3MvKFwqXCovLycg
LWUgJ3MvXCpcKikvLycgXAp0ZXN0c3VpdGUvdGVzdHMvbWlzYy11bnNhZmUvYWxtYWJlbmNoLm1s
ID5hbG1hYmVuY2hfYmVuY2htYXJrLm1sCiAjIG9jYW1sb3B0IGFsbWFiZW5jaF9iZW5jaG1hcmsu
bWwgLXVuc2FmZSAtbyBhbG1hYmVuY2hfYmVuY2htYXJrCiAjIHBlcmYgcmVjb3JkIC1lIGNwdS1j
bG9jayAtdiAtLWNhbGwtZ3JhcGg9ZHdhcmYgLUYgOTkgXAouL2FsbWFiZW5jaF9iZW5jaG1hcmsK
CmNhbGxjaGFpbjogdHlwZSBEV0FSRgpjYWxsY2hhaW46IHN0YWNrIGR1bXAgc2l6ZSA4MTkyCm5y
X2NibG9ja3M6IDAKYWZmaW5pdHk6IFNZUwptbWFwIGZsdXNoOiAxCmNvbXAgbGV2ZWw6IDAKbW1h
cCBzaXplIDUyODM4NEIKbW1hcCBzaXplIDUyODM4NEIKQ29udHJvbCBkZXNjcmlwdG9yIGlzIG5v
dCBpbml0aWFsaXplZAowIDE3LjAwIC0yNi4wNgoxIDEyLjM0IDEuMjkKMiA2LjgzIDIyLjk1CjMg
MC4wNCAtMS4yNgo0IDIuMzAgMTIuNTQKNSAyLjkzIDE0LjM1CjYgMjEuMjcgLTE2LjU3CjcgMjAu
NDEgLTE5LjA0ClsgcGVyZiByZWNvcmQ6IFdva2VuIHVwIDY1IHRpbWVzIHRvIHdyaXRlIGRhdGEg
XQpMb29raW5nIGF0IHRoZSB2bWxpbnV4X3BhdGggKDggZW50cmllcyBsb25nKQpGYWlsZWQgdG8g
b3BlbiAvcHJvYy9rY29yZS4KTm90ZSAvcHJvYy9rY29yZSByZXF1aXJlcyBDQVBfU1lTX1JBV0lP
IGNhcGFiaWxpdHkgdG8gYWNjZXNzLgpVc2luZyAvcHJvYy9rYWxsc3ltcyBmb3Igc3ltYm9scwpm
YWlsZWQgdG8gd3JpdGUgZmVhdHVyZSBDUFVERVNDCmZhaWxlZCB0byB3cml0ZSBmZWF0dXJlIENQ
VUlECmZhaWxlZCB0byB3cml0ZSBmZWF0dXJlIE5VTUFfVE9QT0xPR1kKZmFpbGVkIHRvIHdyaXRl
IGZlYXR1cmUgTUVNX1RPUE9MT0dZClsgcGVyZiByZWNvcmQ6IENhcHR1cmVkIGFuZCB3cm90ZSAx
Ni4yNjUgTUIgcGVyZi5kYXRhICgxOTk3IHNhbXBsZXMpIF0KCiAjIHBlcmYgc2NyaXB0Ci4uLgph
bG1hYmVuY2hfYmVuY2ggIDExOTMgMTQ4MTYuMzk5MjM1OiAgIDEwMTAxMDEwIGNwdS1jbG9jazoK
IDNmYmJkNjNkNTQgcmVkdWNlX3NpbmNvcysweDI2OCAoaW5saW5lZCkKIDNmYmJkNjNkNTQgX19j
b3MrMHgyNjggKC9saWIvbGlibS0yLjMzLnNvKQogMmFhYzRiMjYxYiBBbG1hYmVuY2hfYmVuY2ht
YXJrLnBsYW5ldHB2KzB4MjVmCiAgICAoL2hvbWUvcm9vdC9vY2FtbC9hbG1hYmVuY2hfYmVuY2ht
YXJrKQogMmFhYzRiM2UwMyBBbG1hYmVuY2hfYmVuY2htYXJrLmVudHJ5KzB4MTJiYgogICAgKC9o
b21lL3Jvb3Qvb2NhbWwvYWxtYWJlbmNoX2JlbmNobWFyaykKIDJhYWM0YjAwOTcgY2FtbF9wcm9n
cmFtKzB4MTQzCiAgICAoL2hvbWUvcm9vdC9vY2FtbC9hbG1hYmVuY2hfYmVuY2htYXJrKQogMmFh
YzRlNGUzZCBjYW1sX3N0YXJ0X3Byb2dyYW0rMHg3MQogICAgKC9ob21lL3Jvb3Qvb2NhbWwvYWxt
YWJlbmNoX2JlbmNobWFyaykKIDJhYWM0ZTU0MDkgY2FtbF9zdGFydHVwX2NvbW1vbisweDE4Zgog
ICAgKC9ob21lL3Jvb3Qvb2NhbWwvYWxtYWJlbmNoX2JlbmNobWFyaykKIDJhYWM0ZTU0NjUgY2Ft
bF9zdGFydHVwX2V4bisweDkgKGlubGluZWQpCiAyYWFjNGU1NDY1IGNhbWxfc3RhcnR1cCsweDkg
KGlubGluZWQpCiAyYWFjNGU1NDY1IGNhbWxfbWFpbisweDkKICAgICgvaG9tZS9yb290L29jYW1s
L2FsbWFiZW5jaF9iZW5jaG1hcmspCiAyYWFjNGFmZTg5IG1haW4rMHg5CiAgICAoL2hvbWUvcm9v
dC9vY2FtbC9hbG1hYmVuY2hfYmVuY2htYXJrKQogM2ZiYmM0N2IwYiBfX2xpYmNfc3RhcnRfbWFp
bisweDg1ICgvbGliL2xpYmMtMi4zMy5zbykKIDJhYWM0YWZlYmIgX3N0YXJ0KzB4MmIgKC9ob21l
L3Jvb3Qvb2NhbWwvYWxtYWJlbmNoX2JlbmNobWFyaykKYGBgCgpFZHdpbiBUw7Zyw7ZrICg0KToK
ICB0b29scy9wZXJmL2FyY2gvcmlzY3Y6IHJlY29yZCByZWdpc3RlcnMgbmVlZGVkIGZvciAtLWNh
bGwtZ3JhcGg9ZHdhcmYKICB0b29scy9wZXJmOiBhZGQgcmlzY3YgcGVyZl9yZWdzLmggdG8gY2hl
Y2tfaGVhZGVycy5zaAogIE1BSU5UQUlORVJTOiBhZGQgdG9vbHMvcGVyZi9hcmNoL3Jpc2N2CiAg
dG9vbHMvcGVyZi9hcmNoL3Jpc2N2OiBhZGQgbGliZHcgdW53aW5kIHRlc3QKCiBNQUlOVEFJTkVS
UyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSArCiB0b29scy9wZXJmL2FyY2gv
cmlzY3YvQnVpbGQgICAgICAgICAgICAgICAgfCAgMSArCiB0b29scy9wZXJmL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hcmNoLXRlc3RzLmggfCAxMiArKysrKwogdG9vbHMvcGVyZi9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvcGVyZl9yZWdzLmggIHwgIDIgKwogdG9vbHMvcGVyZi9hcmNoL3Jpc2N2L3Rlc3RzL0J1
aWxkICAgICAgICAgIHwgIDQgKysKIHRvb2xzL3BlcmYvYXJjaC9yaXNjdi90ZXN0cy9hcmNoLXRl
c3RzLmMgICB8IDE2ICsrKysrKwogdG9vbHMvcGVyZi9hcmNoL3Jpc2N2L3Rlc3RzL2R3YXJmLXVu
d2luZC5jIHwgNjMgKysrKysrKysrKysrKysrKysrKysrKwogdG9vbHMvcGVyZi9hcmNoL3Jpc2N2
L3Rlc3RzL3JlZ3NfbG9hZC5TICAgIHwgNDUgKysrKysrKysrKysrKysrKwogdG9vbHMvcGVyZi9h
cmNoL3Jpc2N2L3V0aWwvcGVyZl9yZWdzLmMgICAgIHwgMzIgKysrKysrKysrKysKIHRvb2xzL3Bl
cmYvY2hlY2staGVhZGVycy5zaCAgICAgICAgICAgICAgICB8ICAxICsKIHRvb2xzL3BlcmYvdGVz
dHMvQnVpbGQgICAgICAgICAgICAgICAgICAgICB8ICAyICstCiAxMSBmaWxlcyBjaGFuZ2VkLCAx
NzggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xz
L3BlcmYvYXJjaC9yaXNjdi9pbmNsdWRlL2FyY2gtdGVzdHMuaAogY3JlYXRlIG1vZGUgMTAwNjQ0
IHRvb2xzL3BlcmYvYXJjaC9yaXNjdi90ZXN0cy9CdWlsZAogY3JlYXRlIG1vZGUgMTAwNjQ0IHRv
b2xzL3BlcmYvYXJjaC9yaXNjdi90ZXN0cy9hcmNoLXRlc3RzLmMKIGNyZWF0ZSBtb2RlIDEwMDY0
NCB0b29scy9wZXJmL2FyY2gvcmlzY3YvdGVzdHMvZHdhcmYtdW53aW5kLmMKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCB0b29scy9wZXJmL2FyY2gvcmlzY3YvdGVzdHMvcmVnc19sb2FkLlMKCkNjOiBBbGJl
cnQgT3UgPGFvdUBlZWNzLmJlcmtlbGV5LmVkdT4KQ2M6IEFsZXhhbmRlciBTaGlzaGtpbiA8YWxl
eGFuZGVyLnNoaXNoa2luQGxpbnV4LmludGVsLmNvbT4KQ2M6IEFybmFsZG8gQ2FydmFsaG8gZGUg
TWVsbyA8YWNtZUBrZXJuZWwub3JnPgpDYzogRmFiaWFuIEhlbW1lciA8Y29weUBjb3B5LnNoPgpD
YzogSW5nbyBNb2xuYXIgPG1pbmdvQHJlZGhhdC5jb20+CkNjOiBKaXJpIE9sc2EgPGpvbHNhQHJl
ZGhhdC5jb20+CkNjOiBKb2huIEdhcnJ5IDxqb2huLmdhcnJ5QGh1YXdlaS5jb20+CkNjOiBMZW8g
WWFuIDxsZW8ueWFuQGxpbmFyby5vcmc+CkNjOiBOYW1oeXVuZyBLaW0gPG5hbWh5dW5nQGtlcm5l
bC5vcmc+CkNjOiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQGRhYmJlbHQuY29tPgpDYzogUGF1bCBX
YWxtc2xleSA8cGF1bC53YWxtc2xleUBzaWZpdmUuY29tPgpDYzogUGV0ZXIgWmlqbHN0cmEgPHBl
dGVyekBpbmZyYWRlYWQub3JnPgpDYzogUmVtaSBCZXJub24gPHJiZXJub25AY29kZXdlYXZlcnMu
Y29tPgpDYzogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KQ2M6IGxpbnV4LXBlcmYtdXNl
cnNAdmdlci5rZXJuZWwub3JnCkNjOiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmJh
c2UtY29tbWl0OiBjNzY4MjZhNjVmNTAwMzhmMDUwNDI0MzY1ZGJmM2Y5NzIwM2Y4NzEwCnByZXJl
cXVpc2l0ZS1wYXRjaC1pZDogNzE0NGY4ODBmNDljNjBjZGVjMTFmY2JhZTAxOWU3NjRiYTM3YTcz
ZAotLSAKMi4zMS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
