Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A45C4706C
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Jan 2024 15:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PQevXKgyXb1XrlGMYh2rivHu/DrZ3b7lWHGmjrOoM7U=; b=yMdfw4eSdwMZZj
	B7QqU5HY+B7ZzrYkGLi6W2P3mVTgJPp8Vw2TSoOLkVAW+PXbrT8Foh8zv3qtCY9pucjYN1FDZxATz
	Ng3882ukzUa2WsVMeGFKmQMpYvwYDJmShnYS5g+Nkz54f/loKBnO0mKXcXVbuBcXJoVcQ30pcQE08
	f65pc9BpbfP5MGeoUbuO4ajrwaXWzKekp3sbkO/sZv/WPRrrQOM+rnNgg1nZv9pY0N7L7uGT1kEt9
	xYTAhtYl3XwbmhPTtVBj95U5QzxO60S7168VPFClENwJlJUWPJtHcxRM8+qwE1rQFIMCwpJfk/rHR
	HGMrxjxeaPx13Bk6/sRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOJTM-0039ic-1m;
	Fri, 12 Jan 2024 15:29:28 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOJTJ-0039i7-1R
	for linux-riscv@lists.infradead.org;
	Fri, 12 Jan 2024 15:29:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 22AD2B82339;
	Fri, 12 Jan 2024 15:29:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2384BC433F1;
	Fri, 12 Jan 2024 15:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705073362;
	bh=DLJjWFHmxVcUSA6ZFs8CKLC/FEgZvyxc+TPaYCRFR0I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=T8X1zmzNW5WizaG/sFgKq7Y08A4KiASJCPWqWgJHzIdF2OFu1RTeBcwmi1SP1MyWw
	 ZMPK3RhRCcJpJM18UYNV2dUCB7zNEOiTt88+qeGCWCa+kPUyXheZv8IIobrm44fK2A
	 qOIMnvDiK1zMsaXj9mpgFJ5TmIH0yyPWvPBagrjp3p9pYAOgvD3rOzD1+TuZaTAG7V
	 dRoo2Exppi/B9niAYMWMYqa6DeXSsyS1f6ylAkADoqftpbkjg6HwQx2uAMqmjAATZ4
	 2O1Ol/ttihtQ1HvXen+U28nkbBATQwdLvInxBAY6JR1WJ+JsT0SfuuoDYo/JHEhAo4
	 EoCaNFD5mHsug==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, greentime.hu@sifive.com,
 guoren@linux.alibaba.com, charlie@rivosinc.com, ardb@kernel.org,
 arnd@arndb.de, peterz@infradead.org, tglx@linutronix.de,
 ebiggers@kernel.org, aou@eecs.berkeley.edu
Subject: Re: [v10, 00/10] riscv: support kernel-mode Vector
In-Reply-To: <170504103075.17535.16233182023874920613.git-patchwork-notify@kernel.org>
References: <20240111131558.31211-1-andy.chiu@sifive.com>
 <170504103075.17535.16233182023874920613.git-patchwork-notify@kernel.org>
Date: Fri, 12 Jan 2024 16:29:19 +0100
Message-ID: <87o7dqsh80.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_072925_791205_7452A741 
X-CRM114-Status: UNSURE (   9.09  )
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

QW5keSwKCj4gSGVsbG86Cj4KPiBUaGlzIHNlcmllcyB3YXMgYXBwbGllZCB0byByaXNjdi9saW51
eC5naXQgKGZvci1uZXh0KQo+IGJ5IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29t
PjoKPgoKSSdtIGdldHRpbmcgc29tZSBib290IGlzc3VlcyB3aXRoIHRoaXMgc2VyaWVzIGFwcGxp
ZWQgdG8gcmlzY3YvZm9yLW5leHQuCgpUaGUgZnVsbCBydW5zICh3aXRoIGxvZ3MpIGlzIGhlcmU6
Cmh0dHBzOi8vZ2l0aHViLmNvbS9saW51eC1yaXNjdi9saW51eC1yaXNjdi9hY3Rpb25zL3J1bnMv
NzQ5ODcwNjMyNgoKVHlwaWNhbGx5IGl0IGZhaWxzIGluIHR3byB3YXlzOgpVYnVudHUgcm9vdGZz
OgotLTg8LS0KWyA0LjM0NjQxNF0gKHNkLWdlbnMpWzY4XTogRmFpbGVkIHRvIGV4dHJhY3QgZmls
ZSBuYW1lIGZyb20gJyc6IEludmFsaWQgYXJndW1lbnQKWyA0LjM5MDgzMl0gc3lzdGVtZFsxXTog
RmFpbGVkIHRvIGZvcmsgb2ZmIHNhbmRib3hpbmcgZW52aXJvbm1lbnQgZm9yIGV4ZWN1dGluZyBn
ZW5lcmF0b3JzOiBQcm90b2NvbCBlcnJvcgpbRVNDWzA7MTszMW0hISEhISFFU0NbMG1dIEZhaWxl
ZCB0byBzdGFydCB1cCBtYW5hZ2VyLgpbIDQuNDQwMTY0XSBzeXN0ZW1kWzFdOiBGcmVlemluZyBl
eGVjdXRpb24uCi0tODwtLQoKb3I6Ci0tODwtLQpbICAgMTQuOTA5OTEyXSAoc2QtZ2VucylbNzFd
OiBBc3NlcnRpb24gJyFzdHJ2X2lzZW1wdHkoZGlycyknIGZhaWxlZCBhdCBzcmMvc2hhcmVkL2V4
ZWMtdXRpbC5jOjIxMSwgZnVuY3Rpb24gZXhlY3V0ZV9kaXJlY3RvcmllcygpLiBBYm9ydGluZy4K
WyAgIDE1LjAwODQ4MF0gc3lzdGVtZFsxXTogRmFpbGVkIHRvIGZvcmsgb2ZmIHNhbmRib3hpbmcg
ZW52aXJvbm1lbnQgZm9yIGV4ZWN1dGluZyBnZW5lcmF0b3JzOiBQcm90b2NvbCBlcnJvcgpbRVND
WzA7MTszMW0hISEhISFFU0NbMG1dIEZhaWxlZCB0byBzdGFydCB1cCBtYW5hZ2VyLgpbICAgMTUu
MTExOTg5XSBzeXN0ZW1kWzFdOiBGcmVlemluZyBleGVjdXRpb24uCi0tODwtLQoKYW5kIEFscGlu
ZSB3aXRoOgotLTg8LS0KWyAwLjAzNjcwM10gS2VybmVsIHBhbmljIC0gbm90IHN5bmNpbmc6IGtt
ZW1fY2FjaGVfY3JlYXRlX3VzZXJjb3B5OiBGYWlsZWQgdG8gY3JlYXRlIHNsYWIgJ3Jpc2N2X3Zl
Y3Rvcl9jdHgnLiBFcnJvciAtMjIKWyAwLjAzOTE5NV0gQ1BVOiAwIFBJRDogMCBDb21tOiBzd2Fw
cGVyLzAgTm90IHRhaW50ZWQgNi43LjAtcmMxLWRlZmNvbmZpZ19wbGFpbi1nZGY5NDQ3MDQxODJl
ICMxClsgMC4wNDA3NDRdIEhhcmR3YXJlIG5hbWU6IHJpc2N2LXZpcnRpbyxxZW11IChEVCkKWyAw
LjA0MTk3NV0gQ2FsbCBUcmFjZToKWyAwLjA0MjgxM10gWzxmZmZmZmZmZjgwMDA2N2E0Pl0gZHVt
cF9iYWNrdHJhY2UrMHgxYy8weDI0ClsgMC4wNDQ4MzJdIFs8ZmZmZmZmZmY4MDk0NTk4MD5dIHNo
b3dfc3RhY2srMHgyYy8weDM4ClsgMC4wNDU3MjRdIFs8ZmZmZmZmZmY4MDk1MjIxND5dIGR1bXBf
c3RhY2tfbHZsKzB4M2MvMHg1NApbIDAuMDQ2ODQxXSBbPGZmZmZmZmZmODA5NTIyNDA+XSBkdW1w
X3N0YWNrKzB4MTQvMHgxYwpbIDAuMDQ3NDI4XSBbPGZmZmZmZmZmODA5NDVlN2M+XSBwYW5pYysw
eDEwNi8weDI5ZQpbIDAuMDQ3OTk4XSBbPGZmZmZmZmZmODAxNWYxNGM+XSBrbWVtX2NhY2hlX2Ny
ZWF0ZV91c2VyY29weSsweDIwZS8weDI1OApbIDAuMDQ4Nzg2XSBbPGZmZmZmZmZmODBhMDQ0ZGM+
XSByaXNjdl92X3NldHVwX2N0eF9jYWNoZSsweDJjLzB4M2MKWyAwLjA0OTUyMV0gWzxmZmZmZmZm
ZjgwYTAzYTQ4Pl0gYXJjaF90YXNrX2NhY2hlX2luaXQrMHgxMC8weDE4ClsgMC4wNTc4MzJdIFs8
ZmZmZmZmZmY4MGEwNzA2Yz5dIGZvcmtfaW5pdCsweDQyLzB4MTY4ClsgMC4wNTg3MzddIFs8ZmZm
ZmZmZmY4MGEwMGQ3MD5dIHN0YXJ0X2tlcm5lbCsweDZiYS8weDczYQotLTg8LS0KClRoZSBBbHBp
bmUgYm9vdCBjYW4gYmUgZml4ZWQgd2l0aCBzb21ldGhpbmcgbGlrZToKLS04PC0tCmRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC92ZWN0b3IuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3ZlY3Rv
ci5jCmluZGV4IGY5NzY5NzAzZmQzOS4uMGFjNzlhOWNkYmE1IDEwMDY0NAotLS0gYS9hcmNoL3Jp
c2N2L2tlcm5lbC92ZWN0b3IuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC92ZWN0b3IuYwpAQCAt
NTMsNiArNTMsOSBAQCBpbnQgcmlzY3Zfdl9zZXR1cF92c2l6ZSh2b2lkKQogCiB2b2lkIF9faW5p
dCByaXNjdl92X3NldHVwX2N0eF9jYWNoZSh2b2lkKQogeworICAgICAgIGlmICghcmlzY3Zfdl92
c2l6ZSkKKyAgICAgICAgICAgICAgIHJldHVybjsKKwogICAgICAgIHJpc2N2X3ZfdXNlcl9jYWNo
ZXAgPSBrbWVtX2NhY2hlX2NyZWF0ZV91c2VyY29weSgicmlzY3ZfdmVjdG9yX2N0eCIsCiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJpc2N2
X3ZfdnNpemUsIDE2LCBTTEFCX1BBTklDLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAwLCByaXNjdl92X3ZzaXplLCBOVUxMKTsKLS04PC0t
CgpidXQgd2l0aCB0aGlzICJmaXgiIGluIHBsYWNlIEkgc3RpbGwgZ2V0IFVidW50dSBib290IGZh
aWx1cmVzLiBUbwpyZXByb2R1Y2UgdGhlIENJIGxvY2FsbHk6CgogIHwgZ2l0IGZldGNoIGh0dHBz
Oi8vZ2l0aHViLmNvbS9saW51eC1yaXNjdi9saW51eC1yaXNjdiBlMmFhZDc1YjM0MGQ2NWIwYmU0
ZDFhNjg5ZGIzZTEwYzZlZDNmMThlCiAgfCBnaXQgY2hlY2tvdXQgRkVUQ0hfSEVBRAogIHwgZG9j
a2VyIHB1bGwgZ2hjci5pby9saW51eC1yaXNjdi9wdy1idWlsZGVyLW11bHRpOmxhdGVzdAogIHwg
ZG9ja2VyIHJ1biAtaXQgLS12b2x1bWUgJFBXRDovYnVpbGQvbXktbGludXggZ2hjci5pby9saW51
eC1yaXNjdi9wdy1idWlsZGVyLW11bHRpOmxhdGVzdCBiYXNoCiAgfCAjIEluIGNvbnRhaW5lcgog
IHwgYmFzaCAtbAogIHwgbWtkaXIgLXAgL2J1aWxkL2tlcm5lbHMvbG9ncwogIHwgLmdpdGh1Yi9z
Y3JpcHRzL3Nlcmllcy9wcmVwYXJlX3Rlc3RzLnNoCiAgfCBjZCAvYnVpbGQvbXktbGludXgKICB8
IC5naXRodWIvc2NyaXB0cy9zZXJpZXMva2VybmVsX2J1aWxkZXIuc2ggcnY2NCBkZWZjb25maWcg
cGxhaW4gZ2NjCiAgfCAuZ2l0aHViL3NjcmlwdHMvc2VyaWVzL3Rlc3RfcnVubmVyLnNoIHJ2NjQg
ZGVmY29uZmlnIHBsYWluIGdjYyB1YnVudHUKICB8IC5naXRodWIvc2NyaXB0cy9zZXJpZXMvdGVz
dF9ydW5uZXIuc2ggcnY2NCBkZWZjb25maWcgcGxhaW4gZ2NjIGFscGluZQoKTG9ncyBpbiAvYnVp
bGQvdGVzdHMvcnVuX3Rlc3QqCgpJJ2xsIGNvbnRpbnVlIHRvIGRlYnVnIGluIHRoZSBtZWFudGlt
ZS4KCgpCasO2cm4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
