Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93B99CCF9E3
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Nov 2025 21:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ggEWfXle9+wxOAbpgnCbPJiPhZAT8kNbx1NVZZ4AYYA=; b=Ea4suv4pae2O8b
	jwsDa/o0ktFUHjOtRkUmOkLYDw0lowFPvLk4SMhXCC/1I0iIulTRlyOwtvi5eIp+r5HN/tYxAZHOT
	7J046zzUC2j6Yugq5yG4a0pIHy/N+PiaC36nv2IPSJB0vSIxRhl54AfATy7Y754TJ4Vus5U5hMov3
	4lgAB5230CilKPxOy62xVU9OcH+4udgOHbcufAOjvUUclNuMMCVqJVtDhjvsRssft6slWU1pgnIkp
	FBQJ22QiGQx6dprNYv9W3zfK+TWRhZjzPbanSnBRPYzT0SMYDlPpRJ356ZqwkXKrRzltQ3iMbmGNH
	59opEODIc3BiNrC159aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHUSI-00000001FHL-46W7;
	Fri, 07 Nov 2025 21:57:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHUSG-00000001FFg-01R0
	for linux-riscv@lists.infradead.org;
	Fri, 07 Nov 2025 21:57:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2EF8F44650;
	Fri,  7 Nov 2025 21:57:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB72BC4CEF7;
	Fri,  7 Nov 2025 21:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762552630;
	bh=Xkt+of8KxrqMro0Ntcjzu/R8T+v1krSu+SWLso+jtvE=;
	h=From:Date:Subject:To:Cc:From;
	b=eUGErAHXK2x/+G8M7EcDFbx+giSXDUAc4NNp9fY2jxETB2kFEo+UAyss0DFFjz6Z0
	 zRXewVmUxciyGbWFGrVjQvYIfPiSPRqS4Jx6uBfDAg8qbGTmYGAPU6U9iiC+nDZCBT
	 n9rEN+lfrSXK5KA4z1Pp9QMQRVUPKUVT/aXeV/Sg+QHwgDIwUfReqBAaTLSOsm9mEN
	 E/caEEHTk/1s4DVR7L9Q1QNgpLHdXI4CRTtVbF/9jvlluoOq/xkEmKo+FfYRgJ2/5B
	 FCFfeLjnOMGJRc9fHYeJsC6DxToyVCvhBwD/P8BKD7alwER6fGUfysol05GHIrBBOE
	 6drHIiez785bg==
From: Nathan Chancellor <nathan@kernel.org>
Date: Fri, 07 Nov 2025 14:56:59 -0700
Subject: [PATCH fixes] riscv: Fix CONFIG_AS_HAS_INSN for new .insn usage
MIME-Version: 1.0
Message-Id: <20251107-riscv-fix-new-insn-usage-v1-1-9a186c5928a0@kernel.org>
X-B4-Tracking: v=1; b=H4sIACprDmkC/yWMQQqDQAxFryJZG5iJ2JFepbiQMdZsokyoFWTub
 mh3/8F7/wLjImzwbC4ofIjJpg6xbSCvk74ZZXYGCtTHGBIWsXzgIicqf1HUFD82uUf0iF1KmeZ
 uAM/3wm79rl/wX2OtN4W/7sZxAAAA
X-Change-ID: 20251107-riscv-fix-new-insn-usage-2261377c2d38
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Andrew Jones <ajones@ventanamicro.com>, 
 Ben Dooks <ben.dooks@codethink.co.uk>, linux-riscv@lists.infradead.org, 
 llvm@lists.linux.dev, patches@lists.linux.dev, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3034; i=nathan@kernel.org;
 h=from:subject:message-id; bh=Xkt+of8KxrqMro0Ntcjzu/R8T+v1krSu+SWLso+jtvE=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJl82cZmFkwsb82PlhVoueaXBP/W9w2dbr77/GZVFcVJO
 Xx+BnwdpSwMYlwMsmKKLNWPVY8bGs45y3jj1CSYOaxMIEMYuDgFYCJfdBkZJkczznOM73faWvRV
 SFVn9+G8y1eF2F89D3W439KYkaW2iZFhP9+kbYp3uLvCKhZliUjnTrb6uGRtnrD14SlOlxhUuix
 4AQ==
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_135712_095189_56DC35C2 
X-CRM114-Status: UNSURE (   9.60  )
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

QWZ0ZXIgY29tbWl0IDQ0YWEyNWMwMDBiNCAoInJpc2N2OiBhc206IHVzZSAuaW5zbiBmb3IgbWFr
aW5nIGN1c3RvbQppbnN0cnVjdGlvbnMiKSwgYnVpbGRzIHVzaW5nIExMVk0gb2xkZXIgdGhhdCAx
OSBvciBiaW51dGlscyBvbGRlciB0aGFuCjIuMzggZmFpbCB3aXRoOgoKICBhcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL3Zkc28vcHJvY2Vzc29yLmg6IEFzc2VtYmxlciBtZXNzYWdlczoKICBhcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL3Zkc28vcHJvY2Vzc29yLmg6Mjc6IEVycm9yOiB1bnJlY29nbml6ZWQg
b3Bjb2RlIGAweDEwMDAwMGYnCiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZHNvL3Byb2Nlc3Nv
ci5oOjI3OiBFcnJvcjogdW5yZWNvZ25pemVkIG9wY29kZSBgMHgxMDAwMDBmJwogIGFyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vdmRzby9wcm9jZXNzb3IuaDoyNzogRXJyb3I6IHVucmVjb2duaXplZCBv
cGNvZGUgYDB4MTAwMDAwZicKICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Zkc28vcHJvY2Vzc29y
Lmg6Mjc6IEVycm9yOiB1bnJlY29nbml6ZWQgb3Bjb2RlIGAweDEwMDAwMGYnCiAgbWFrZVs0XTog
KioqIFtzY3JpcHRzL01ha2VmaWxlLmJ1aWxkOjI4NzogYXJjaC9yaXNjdi9rZXJuZWwvdmRzby92
Z2V0dGltZW9mZGF5Lm9dIEVycm9yIDEKCiAgSW4gZmlsZSBpbmNsdWRlZCBmcm9tIDxidWlsdC1p
bj46NDoKICBJbiBmaWxlIGluY2x1ZGVkIGZyb20gbGliL3Zkc28vZ2V0dGltZW9mZGF5LmM6NjoK
ICBJbiBmaWxlIGluY2x1ZGVkIGZyb20gaW5jbHVkZS92ZHNvL2RhdGFwYWdlLmg6MjE6CiAgSW4g
ZmlsZSBpbmNsdWRlZCBmcm9tIGluY2x1ZGUvdmRzby9wcm9jZXNzb3IuaDoxMDoKICBhcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL3Zkc28vcHJvY2Vzc29yLmg6MjM6MjogZXJyb3I6IGV4cGVjdGVkIGlu
c3RydWN0aW9uIGZvcm1hdAogICAgIDIzIHwgICAgICAgICBBTFRfUklTQ1ZfUEFVU0UoKTsKICAg
ICAgICB8ICAgICAgICAgXgogIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vZXJyYXRhX2xpc3QuaDo0
NzozOiBub3RlOiBleHBhbmRlZCBmcm9tIG1hY3JvICdBTFRfUklTQ1ZfUEFVU0UnCiAgICAgNDcg
fCAgICAgICAgICAgICAgICAgUklTQ1ZfUEFVU0UsIC8qIE9yaWdpbmFsIFJJU0PigJFWIHBhdXNl
IGluc24gKi8gXAogICAgICAgIHwgICAgICAgICAgICAgICAgIF4KICBhcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL2luc24tZGVmLmg6MjU5OjIxOiBub3RlOiBleHBhbmRlZCBmcm9tIG1hY3JvICdSSVND
Vl9QQVVTRScKICAgIDI1OSB8ICNkZWZpbmUgUklTQ1ZfUEFVU0UgICAgIEFTTV9JTlNOX0koIjB4
MTAwMDAwZiIpCiAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICBeCiAgYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9hc20uaDoxNjoyNjogbm90ZTogZXhwYW5kZWQgZnJvbSBtYWNybyAnQVNN
X0lOU05fSScKICAgICAxNiB8ICNkZWZpbmUgQVNNX0lOU05fSShfX3gpICIuaW5zbiAiIF9feAog
ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgIF4KICA8aW5saW5lIGFzbT46NTo3OiBu
b3RlOiBpbnN0YW50aWF0ZWQgaW50byBhc3NlbWJseSBoZXJlCiAgICAgIDUgfCAuaW5zbiAweDEw
MDAwMGYKICAgICAgICB8ICAgICAgIF4KCmJpbnV0aWxzIGdhaW5lZCBzdXBwb3J0IGZvciAnLmlu
c24gPHZhbHVlPicgaW4gMi4zOCBbMV0gYW5kIExMVk0gZ2FpbmVkCnN1cHBvcnQgaW4gMTkgWzJd
LiBBZGp1c3QgdGhlIHRlc3QgZm9yIENPTkZJR19BU19IQVNfSU5TTiB0byBlbnN1cmUgdGhhdAph
bGwgdmVyc2lvbnMgb2YgLmluc24gYXJlIHN1cHBvcnRlZCBiZWZvcmUgYmVpbmcgdXNlZC4KCkZp
eGVzOiA0NGFhMjVjMDAwYjQgKCJyaXNjdjogYXNtOiB1c2UgLmluc24gZm9yIG1ha2luZyBjdXN0
b20gaW5zdHJ1Y3Rpb25zIikKTGluazogaHR0cHM6Ly9zb3VyY2V3YXJlLm9yZy9naXQvP3A9Ymlu
dXRpbHMtZ2RiLmdpdDthPWNvbW1pdDtoPWEyNjJiODJmZGJmNGNkYTNiMDY0OGIxYWRjMzIyNDVj
YTNmNzhiN2EgWzFdCkxpbms6IGh0dHBzOi8vZ2l0aHViLmNvbS9sbHZtL2xsdm0tcHJvamVjdC9j
b21taXQvMmEwODZkY2U2OTFlM2NjMzRhMmZjMjdmNGZiMjU1YmIyY2JiZmFjOSBbMl0KU3VnZ2Vz
dGVkLWJ5OiBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPgpTaWduZWQtb2Zm
LWJ5OiBOYXRoYW4gQ2hhbmNlbGxvciA8bmF0aGFuQGtlcm5lbC5vcmc+Ci0tLQogYXJjaC9yaXNj
di9LY29uZmlnIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9LY29uZmlnIGIvYXJjaC9yaXNjdi9LY29u
ZmlnCmluZGV4IDIyY2RhOWM0NTJkMi4uZmFkZWMyMGI4N2E4IDEwMDY0NAotLS0gYS9hcmNoL3Jp
c2N2L0tjb25maWcKKysrIGIvYXJjaC9yaXNjdi9LY29uZmlnCkBAIC0zNjcsNyArMzY3LDcgQEAg
Y29uZmlnIFJJU0NWX05PTlNUQU5EQVJEX0NBQ0hFX09QUwogCSAgc3lzdGVtcyB0byBoYW5kbGUg
Y2FjaGUgbWFuYWdlbWVudC4KIAogY29uZmlnIEFTX0hBU19JTlNOCi0JZGVmX2Jvb2wgJChhcy1p
bnN0ciwuaW5zbiByIDUxJChjb21tYSkgMCQoY29tbWEpIDAkKGNvbW1hKSB0MCQoY29tbWEpIHQw
JChjb21tYSkgemVybykKKwlkZWZfYm9vbCAkKGFzLWluc3RyLC5pbnNuIDB4MTAwMDAwZikKIAog
Y29uZmlnIEFTX0hBU19PUFRJT05fQVJDSAogCSMgaHR0cHM6Ly9naXRodWIuY29tL2xsdm0vbGx2
bS1wcm9qZWN0L2NvbW1pdC85ZThlZDM0MDNjMTkxYWI5YzQ5MDNlOGVlYjhmNzMyZmY4YTQzY2I0
CgotLS0KYmFzZS1jb21taXQ6IGE4ODIxMjZjNDJmYzUzMjc1YWM5MTk2OWQ0NjBkOTM5MTkxZGI3
YjAKY2hhbmdlLWlkOiAyMDI1MTEwNy1yaXNjdi1maXgtbmV3LWluc24tdXNhZ2UtMjI2MTM3N2My
ZDM4CgpCZXN0IHJlZ2FyZHMsCi0tICAKTmF0aGFuIENoYW5jZWxsb3IgPG5hdGhhbkBrZXJuZWwu
b3JnPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
