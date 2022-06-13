Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2058EC43334
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jun 2022 01:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1bCP8wED5jEcOWvgff32qMxgJ+WXkPGjj9A8ZezyK/0=; b=CHbqvGppZqAqFa
	eTaJs+nTafnT/0CdO9e2q6XcYApAPRIqlihlpG/5dntMLGRagRszbuJsUbGep5oZEqVbGNu2AfVQf
	b9vP3MTEfRlVsO5YCKkxX90mLBdHeqv81qbSMbLP6Byxe79ubAUw7Q1HfU/OVQbpn+8FLXVcUSXmO
	JnWOn+IMLbKfpjdnX7z/HKYz58hHRpKQYbo+cdJ4sZwdobPLZFJHfymXWyXXTTv+VmdmrE7oQdge8
	zcTJ9tNQAAI23PwlmxCgAxLfC0dUvHCabRnPsmrz5nG/hP7dU2S2ep+xv++Bon/bulH7vi5yK8bKx
	R263GcYs2uOnDK7ONw+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0YvH-000kjr-KO; Mon, 13 Jun 2022 01:31:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0YvE-000kjE-Vn
	for linux-riscv@lists.infradead.org; Mon, 13 Jun 2022 01:31:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BBAE2611E2;
	Mon, 13 Jun 2022 01:31:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E3C4C34115;
	Mon, 13 Jun 2022 01:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655083873;
	bh=RVAyZuqlwM/hDCOHKUQEWUEw9mlKJE2gEK5yaIsZ4to=;
	h=From:To:Cc:Subject:Date:From;
	b=oHdlufOHxW6XFaMV+oOWi8IucAsP/2KBIE4/fnDJ4fRoVSM6PUMW/Xkdu8sUZUhMo
	 I7gYwme3y+XPuoSGxp65UkpNt1yuR7v/mdBPVWBy5TZiqyFcutWKvSS/l/T5vyRVdB
	 48FYnZvyfimqbWKMgQwckbae+NwbP3rxIkcDBX0ArXbtyCBUeymYa+YgXKkxD5e0dw
	 2MDJiDLn9TkZgh5zvFRbGs61JqmQ5zcyF49vYljd0xrvgihhn8DRYgDyN9V4uFfV21
	 /OLc3yGJvY2vmE/DNFUFW9k1Gza7wrPkg6dIoI9qfHThWZ/X0rTWeaObP+Xi17zAy2
	 79FEsvSEiYQeg==
From: guoren@kernel.org
To: palmer@rivosinc.com,
	arnd@arndb.de,
	linux@roeck-us.net,
	palmer@dabbelt.com,
	heiko@sntech.de
Cc: linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>,
	Eugene Syromiatnikov <esyr@redhat.com>,
	Christoph Hellwig <hch@lst.de>
Subject: [PATCH] uapi: Fixup strace compile error
Date: Sun, 12 Jun 2022 21:30:51 -0400
Message-Id: <20220613013051.1741434-1-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220612_183117_148271_6D026D69 
X-CRM114-Status: GOOD (  13.94  )
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

RnJvbTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgoKVGhlcmUgaXMgbm8gQ09O
RklHXzY0QklUIGluIHVzZXJzcGFjZSwgd2Ugc2hvdWxkbid0IGxpbWl0IGl0IHdpdGgKX19CSVRT
X1BFUl9MT05HID09IDMyIHRvIGJyZWFrIHRoZSBjb21wYXRpYmlsaXR5LiBKdXN0IGV4cG9ydCBG
Xyo2NApkZWZpbml0aW9ucyB0byB1c2Vyc3BhY2UgcGVybWFuZW50bHkuCgpnY2MtMTEgLURIQVZF
X0NPTkZJR19IICAgLUkuL2xpbnV4L3g4Nl82NCAtSS4uLy4uLy4uL3NyYy9saW51eC94ODZfNjQK
LUkuL2xpbnV4L2dlbmVyaWMgLUkuLi8uLi8uLi9zcmMvbGludXgvZ2VuZXJpYyAtSS4gLUkuLi8u
Li8uLi9zcmMKLURJTl9TVFJBQ0U9MSAgICAgIC1pc3lzdGVtIC9vcHQva2VybmVsL2luY2x1ZGUg
LVdhbGwgLVdleHRyYQotV25vLW1pc3NpbmctZmllbGQtaW5pdGlhbGl6ZXJzIC1Xbm8tdW51c2Vk
LXBhcmFtZXRlciAtV2RhdGUtdGltZQotV2Zvcm1hdC1zZWN1cml0eSAtV2ltcGxpY2l0LWZhbGx0
aHJvdWdoPTUgLVdpbml0LXNlbGYgLVdsb2dpY2FsLW9wCi1XbWlzc2luZy1wcm90b3R5cGVzIC1X
bmVzdGVkLWV4dGVybnMgLVdvbGQtc3R5bGUtZGVmaW5pdGlvbgotV3RyYW1wb2xpbmVzIC1XdW5k
ZWYgLVd3cml0ZS1zdHJpbmdzIC1XZXJyb3IgICAtZyAtTzIgLWMgLW8KbGlic3RyYWNlX2EtZmV0
Y2hfYnBmX2Zwcm9nLm8gYHRlc3QgLWYgJ2ZldGNoX2JwZl9mcHJvZy5jJyB8fCBlY2hvCicuLi8u
Li8uLi9zcmMvJ2BmZXRjaF9icGZfZnByb2cuYwpJbiBmaWxlIGluY2x1ZGVkIGZyb20gLi4vLi4v
Li4vc3JjL2RlZnMuaDo0MDQsCiAgICAgICAgICAgICAgICAgZnJvbSAuLi8uLi8uLi9zcmMvZmNu
dGwuYzoxMjoKLi4vLi4vLi4vc3JjL3hsYXQvZmNudGxjbWRzLmg6NTQ6NzogZXJyb3I6IOKAmEZf
R0VUTEs2NOKAmSB1bmRlY2xhcmVkIGhlcmUKKG5vdCBpbiBhIGZ1bmN0aW9uKTsgZGlkIHlvdSBt
ZWFuIOKAmEZfR0VUTEvigJk/CiAgIDU0IHwgIFhMQVQoRl9HRVRMSzY0KSwKICAgICAgfCAgICAg
ICBefn5+fn5+fn4KLi4vLi4vLi4vc3JjL3hsYXQuaDo2NDo1NDogbm90ZTogaW4gZGVmaW5pdGlv
biBvZiBtYWNybyDigJhYTEFU4oCZCiAgIDY0IHwgIyBkZWZpbmUgWExBVCh2YWwpICAgICAgICAg
ICAgICAgICAgICAgIHsgKHVuc2lnbmVkKSh2YWwpLCAjdmFsCiAgICAgIH0KICAgICAgfCAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fgouLi8u
Li8uLi9zcmMveGxhdC9mY250bGNtZHMuaDo1Nzo3OiBlcnJvcjog4oCYRl9TRVRMSzY04oCZIHVu
ZGVjbGFyZWQgaGVyZQoobm90IGluIGEgZnVuY3Rpb24pOyBkaWQgeW91IG1lYW4g4oCYRl9TRVRM
S+KAmT8KICAgNTcgfCAgWExBVChGX1NFVExLNjQpLAogICAgICB8ICAgICAgIF5+fn5+fn5+fgou
Li8uLi8uLi9zcmMveGxhdC5oOjY0OjU0OiBub3RlOiBpbiBkZWZpbml0aW9uIG9mIG1hY3JvIOKA
mFhMQVTigJkKICAgNjQgfCAjIGRlZmluZSBYTEFUKHZhbCkgICAgICAgICAgICAgICAgICAgICAg
eyAodW5zaWduZWQpKHZhbCksICN2YWwKICAgICAgfQogICAgICB8ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+Ci4uLy4uLy4uL3NyYy94bGF0
L2ZjbnRsY21kcy5oOjYwOjc6IGVycm9yOiDigJhGX1NFVExLVzY04oCZIHVuZGVjbGFyZWQgaGVy
ZQoobm90IGluIGEgZnVuY3Rpb24pOyBkaWQgeW91IG1lYW4g4oCYRl9TRVRMS1figJk/CiAgIDYw
IHwgIFhMQVQoRl9TRVRMS1c2NCksCiAgICAgIHwgICAgICAgXn5+fn5+fn5+fgouLi8uLi8uLi9z
cmMveGxhdC5oOjY0OjU0OiBub3RlOiBpbiBkZWZpbml0aW9uIG9mIG1hY3JvIOKAmFhMQVTigJkK
ICAgNjQgfCAjIGRlZmluZSBYTEFUKHZhbCkgICAgICAgICAgICAgICAgICAgICAgeyAodW5zaWdu
ZWQpKHZhbCksICN2YWwKICAgICAgfQogICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+Cm1ha2VbNF06ICoqKiBbTWFrZWZpbGU6NTAx
NzogbGlic3RyYWNlX2EtZmNudGwub10gRXJyb3IgMQoKY29tbWVudCBieSBFdWdlbmU6CkFjdHVh
bGx5LCBpdCdzIHF1aXRlIHRoZSBvcHBvc2l0ZTogImlmbmRlZiIgdXNhZ2UgbWFkZSBpdCB2YWls
YWJsZSBhdCBhbGwKdGltZXMgdG8gdGhlIHVzZXJzcGFjZSwgYW5kIHRoaXMgY2hhbmdlIGhhcyBh
Y3R1YWxseSBicm9rZW4gYnVpbGRpbmcgc3RyYWNlCndpdGggdGhlIGxhdGVzdCBrZXJuZWwgaGVh
ZGVyc1sxXVsyXS4gIFRoZXJlIGNvdWxkIGJlIHNvbWUgZGViYXRlIHdoZXRoZXIKaGF2aW5nIHRo
ZXNlIEZfKjY0IGRlZmluaXRpb25zIGV4cG9zZWQgdG8gdGhlIHVzZXIgc3BhY2UgNjQtYml0CmFw
cGxpY2F0aW9ucywgYnV0IGl0IHNlZW1zIHRoYXQgd2VyZSBubyBoYXJtIChhcyB0aGV5IHdlcmUg
ZXhwb3NlZCBhbHJlYWR5CmZvciBxdWl0ZSBzb21lIHRpbWUpLCBhbmQgdGhleSBhcmUgdXNlZnVs
IGF0IGxlYXN0IGZvciBzdHJhY2UgZm9yIGNvbXBhdAphcHBsaWNhdGlvbiB0cmFjaW5nIHB1cnBv
c2VzLgoKRml4ZXM6IDMwNmY3Y2MxZTkwNjEgInVhcGk6IGFsd2F5cyBkZWZpbmUgRl9HRVRMSzY0
L0ZfU0VUTEs2NC9GX1NFVExLVzY0IGluIGZjbnRsLmgiClNpZ25lZC1vZmYtYnk6IEd1byBSZW4g
PGd1b3JlbkBsaW51eC5hbGliYWJhLmNvbT4KUmVwb3J0ZWQtYnk6IEV1Z2VuZSBTeXJvbWlhdG5p
a292IDxlc3lyQHJlZGhhdC5jb20+CkNjOiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4K
Q2M6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+CkNjOiBIZWlrbyBTdHVlYm5lciA8aGVp
a29Ac250ZWNoLmRlPgpDYzogUGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+Ci0t
LQogaW5jbHVkZS91YXBpL2FzbS1nZW5lcmljL2ZjbnRsLmggfCAyIC0tCiAxIGZpbGUgY2hhbmdl
ZCwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvYXNtLWdlbmVyaWMv
ZmNudGwuaCBiL2luY2x1ZGUvdWFwaS9hc20tZ2VuZXJpYy9mY250bC5oCmluZGV4IGYxM2QzN2I2
MDc3NS4uY2Q2YmQ2NWVjMjVkIDEwMDY0NAotLS0gYS9pbmNsdWRlL3VhcGkvYXNtLWdlbmVyaWMv
ZmNudGwuaAorKysgYi9pbmNsdWRlL3VhcGkvYXNtLWdlbmVyaWMvZmNudGwuaApAQCAtMTE2LDEz
ICsxMTYsMTEgQEAKICNkZWZpbmUgRl9HRVRTSUcJMTEJLyogZm9yIHNvY2tldHMuICovCiAjZW5k
aWYKIAotI2lmIF9fQklUU19QRVJfTE9ORyA9PSAzMiB8fCBkZWZpbmVkKF9fS0VSTkVMX18pCiAj
aWZuZGVmIEZfR0VUTEs2NAogI2RlZmluZSBGX0dFVExLNjQJMTIJLyogIHVzaW5nICdzdHJ1Y3Qg
ZmxvY2s2NCcgKi8KICNkZWZpbmUgRl9TRVRMSzY0CTEzCiAjZGVmaW5lIEZfU0VUTEtXNjQJMTQK
ICNlbmRpZgotI2VuZGlmIC8qIF9fQklUU19QRVJfTE9ORyA9PSAzMiB8fCBkZWZpbmVkKF9fS0VS
TkVMX18pICovCiAKICNpZm5kZWYgRl9TRVRPV05fRVgKICNkZWZpbmUgRl9TRVRPV05fRVgJMTUK
LS0gCjIuMzYuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
