Return-Path: <SRS0=ohv9=AJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF434C433E0
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Jun 2020 16:25:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E72920773
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Jun 2020 16:25:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZBsPDlt4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y3OerUbS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E72920773
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:Message-Id:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yqx+qEiz8wS4SAor1+YUHQUrxmDtm5FNPsZVZP1SC5c=; b=ZBsPDlt4N0a9zX/K0Saaw3/EV
	rjE51t4AQ/1+mcPGYZG5NXjyN4MP8PoLfn6ov3ykCvaGKNS0hxTi8V3SVdAfdnlbQM4PMl985CSZ+
	d4GpTCgUF0fvnWgOSRJCdA6GJp50hwlTrchHtrUJqEda1W9sD7BTk0/EO3IVvxhK6vvckBcQ9TsfY
	7Oc9TM3OArcJVUzO9mUiFX4CTsWijTwF5zHFwxiNtBoyBbNE6Voobnkci1nsQlOwQWH0jRC0q2Tyb
	lNtKaw5ZBb9lqnJWnF3uGhh5AEycfix8qmehvpL0NiumnHnkVJhfb2bZtH08JRGdGtfW67VWq52ox
	7DKE0gijg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpa7Y-0000ZT-AQ; Sun, 28 Jun 2020 16:25:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpa7W-0000ZE-Og
 for linux-riscv@lists.infradead.org; Sun, 28 Jun 2020 16:25:31 +0000
Received: from devnote2 (NE2965lan1.rev.em-net.ne.jp [210.141.244.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BA64420771;
 Sun, 28 Jun 2020 16:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593361529;
 bh=4MsHQYCfwDNcgoFMDxuBklP42iO6H/Lxo4tZHOVpT+g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Y3OerUbSLeNsgby2H3gQ4ClZuu9Zc3iA1DveyUjBNkbUmzJjyjMVL6Vb326AxTmc+
 d1F44707pI8ZM34pAusrVj+gcJP9Yco0Ubr0359g2vTm8O/xdQkr6AzJo1+9hh6/GA
 b87a/tUXaPeXFae/mUxAQbck2dPswuPgYMtjP/74=
Date: Mon, 29 Jun 2020 01:25:24 +0900
From: Masami Hiramatsu <mhiramat@kernel.org>
To: guoren@kernel.org
Subject: Re: [PATCH V2] riscv: Fixup compile error BUILD_BUG_ON failed
Message-Id: <20200629012524.c941a5f18aa7f312d325f714@kernel.org>
In-Reply-To: <1593360457-23827-1-git-send-email-guoren@kernel.org>
References: <1593360457-23827-1-git-send-email-guoren@kernel.org>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Guo Ren <guoren@linux.alibaba.com>, anup@brainfault.org,
 palmerdabbelt@google.com, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, zong.li@sifive.com, paul.walmsley@sifive.com,
 greentime.hu@sifive.com, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gU3VuLCAyOCBKdW4gMjAyMCAxNjowNzozNyArMDAwMApndW9yZW5Aa2VybmVsLm9yZyB3cm90
ZToKCj4gRnJvbTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+IAo+IFVuZm9y
dHVuYXRlbHksIHRoZSBjdXJyZW50IGNvZGUgY291bGRuJ3QgYmUgY29tcGlsZWQ6Cj4gCj4gICBD
QyAgICAgIGFyY2gvcmlzY3Yva2VybmVsL3BhdGNoLm8KPiBJbiBmaWxlIGluY2x1ZGVkIGZyb20g
Li9pbmNsdWRlL2xpbnV4L2tlcm5lbC5oOjExLAo+ICAgICAgICAgICAgICAgICAgZnJvbSAuL2lu
Y2x1ZGUvbGludXgvbGlzdC5oOjksCj4gICAgICAgICAgICAgICAgICBmcm9tIC4vaW5jbHVkZS9s
aW51eC9wcmVlbXB0Lmg6MTEsCj4gICAgICAgICAgICAgICAgICBmcm9tIC4vaW5jbHVkZS9saW51
eC9zcGlubG9jay5oOjUxLAo+ICAgICAgICAgICAgICAgICAgZnJvbSBhcmNoL3Jpc2N2L2tlcm5l
bC9wYXRjaC5jOjY6Cj4gSW4gZnVuY3Rpb24g4oCYZml4X3RvX3ZpcnTigJksCj4gICAgIGlubGlu
ZWQgZnJvbSDigJhwYXRjaF9tYXDigJkgYXQgYXJjaC9yaXNjdi9rZXJuZWwvcGF0Y2guYzozNzox
NzoKPiAuL2luY2x1ZGUvbGludXgvY29tcGlsZXIuaDozOTI6Mzg6IGVycm9yOiBjYWxsIHRvIOKA
mF9fY29tcGlsZXRpbWVfYXNzZXJ0XzIwNeKAmSBkZWNsYXJlZCB3aXRoIGF0dHJpYnV0ZSBlcnJv
cjogQlVJTERfQlVHX09OIGZhaWxlZDogaWR4ID49IF9fZW5kX29mX2ZpeGVkX2FkZHJlc3Nlcwo+
ICAgX2NvbXBpbGV0aW1lX2Fzc2VydChjb25kaXRpb24sIG1zZywgX19jb21waWxldGltZV9hc3Nl
cnRfLCBfX0NPVU5URVJfXykKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IF4KPiAuL2luY2x1ZGUvbGludXgvY29tcGlsZXIuaDozNzM6NDogbm90ZTogaW4gZGVmaW5pdGlv
biBvZiBtYWNybyDigJhfX2NvbXBpbGV0aW1lX2Fzc2VydOKAmQo+ICAgICBwcmVmaXggIyMgc3Vm
Zml4KCk7ICAgIFwKPiAgICAgXn5+fn5+Cj4gLi9pbmNsdWRlL2xpbnV4L2NvbXBpbGVyLmg6Mzky
OjI6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJhfY29tcGlsZXRpbWVfYXNzZXJ04oCZ
Cj4gICBfY29tcGlsZXRpbWVfYXNzZXJ0KGNvbmRpdGlvbiwgbXNnLCBfX2NvbXBpbGV0aW1lX2Fz
c2VydF8sIF9fQ09VTlRFUl9fKQo+ICAgXn5+fn5+fn5+fn5+fn5+fn5+fgo+IC4vaW5jbHVkZS9s
aW51eC9idWlsZF9idWcuaDozOTozNzogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmGNv
bXBpbGV0aW1lX2Fzc2VydOKAmQo+ICAjZGVmaW5lIEJVSUxEX0JVR19PTl9NU0coY29uZCwgbXNn
KSBjb21waWxldGltZV9hc3NlcnQoIShjb25kKSwgbXNnKQo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn4KPiAuL2luY2x1ZGUvbGludXgvYnVp
bGRfYnVnLmg6NTA6Mjogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmEJVSUxEX0JVR19P
Tl9NU0figJkKPiAgIEJVSUxEX0JVR19PTl9NU0coY29uZGl0aW9uLCAiQlVJTERfQlVHX09OIGZh
aWxlZDogIiAjY29uZGl0aW9uKQo+ICAgXn5+fn5+fn5+fn5+fn5+fgo+IC4vaW5jbHVkZS9hc20t
Z2VuZXJpYy9maXhtYXAuaDozMjoyOiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g4oCYQlVJ
TERfQlVHX09O4oCZCj4gICBCVUlMRF9CVUdfT04oaWR4ID49IF9fZW5kX29mX2ZpeGVkX2FkZHJl
c3Nlcyk7Cj4gICBefn5+fn5+fn5+fn4KPiAKPiBCZWNhdXNlIGZpeF90b192aXJ0KCwgaWR4KSBu
ZWVkcyBhIGNvbnN0IHZhbHVlLCBub3QgYSBkeW5hbWljIHZhcmlhYmxlIG9mCj4gcmVnLWEwIG9y
IEJVSUxEX0JVR19PTiBmYWlsZWQgd2l0aCAiaWR4ID49IF9fZW5kX29mX2ZpeGVkX2FkZHJlc3Nl
cyIuCgpMb29rcyBnb29kIHRvIG1lIDopCgpSZXZpZXdlZC1ieTogTWFzYW1pIEhpcmFtYXRzdSA8
bWhpcmFtYXRAa2VybmVsLm9yZz4KClRoYW5rcyEKCj4gCj4gU2lnbmVkLW9mZi1ieTogR3VvIFJl
biA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+IENjOiBNYXNhbWkgSGlyYW1hdHN1IDxtaGly
YW1hdEBrZXJuZWwub3JnPgo+IENjOiBab25nIExpIDx6b25nLmxpQHNpZml2ZS5jb20+Cj4gLS0t
Cj4gQ2hhbmdlbG9nIFYyOgo+ICAtIFVzZSBfX2Fsd2F5c19pbmxpbmUgYXMgc2FtZSBhcyBmaXhf
dG9fdmlydAo+ICAtIFVzZSBjb25zdCAiY29uc3QgdW5zaWduZWQgaW50IiBmb3IgMnRoIHBhcmFt
Cj4gCj4gU2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+
IC0tLQo+ICBhcmNoL3Jpc2N2L2tlcm5lbC9wYXRjaC5jIHwgOCArKysrKystLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L2tlcm5lbC9wYXRjaC5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvcGF0Y2guYwo+
IGluZGV4IGQ0YTY0ZGYuLjMxNzlhNGUgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwv
cGF0Y2guYwo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3BhdGNoLmMKPiBAQCAtMjAsNyArMjAs
MTIgQEAgc3RydWN0IHBhdGNoX2luc24gewo+ICB9Owo+ICAKPiAgI2lmZGVmIENPTkZJR19NTVUK
PiAtc3RhdGljIHZvaWQgKnBhdGNoX21hcCh2b2lkICphZGRyLCBpbnQgZml4bWFwKQo+ICsvKgo+
ICsgKiBUaGUgZml4X3RvX3ZpcnQoLCBpZHgpIG5lZWRzIGEgY29uc3QgdmFsdWUgKG5vdCBhIGR5
bmFtaWMgdmFyaWFibGUgb2YKPiArICogcmVnLWEwKSBvciBCVUlMRF9CVUdfT04gZmFpbGVkIHdp
dGggImlkeCA+PSBfX2VuZF9vZl9maXhlZF9hZGRyZXNzZXMiLgo+ICsgKiBTbyB1c2UgJ19fYWx3
YXlzX2lubGluZScgYW5kICdjb25zdCB1bnNpZ25lZCBpbnQgZml4bWFwJyBoZXJlLgo+ICsgKi8K
PiArc3RhdGljIF9fYWx3YXlzX2lubGluZSB2b2lkICpwYXRjaF9tYXAodm9pZCAqYWRkciwgY29u
c3QgdW5zaWduZWQgaW50IGZpeG1hcCkKPiAgewo+ICAJdWludHB0cl90IHVpbnRhZGRyID0gKHVp
bnRwdHJfdCkgYWRkcjsKPiAgCXN0cnVjdCBwYWdlICpwYWdlOwo+IEBAIC0zNyw3ICs0Miw2IEBA
IHN0YXRpYyB2b2lkICpwYXRjaF9tYXAodm9pZCAqYWRkciwgaW50IGZpeG1hcCkKPiAgCXJldHVy
biAodm9pZCAqKXNldF9maXhtYXBfb2Zmc2V0KGZpeG1hcCwgcGFnZV90b19waHlzKHBhZ2UpICsK
PiAgCQkJCQkgKHVpbnRhZGRyICYgflBBR0VfTUFTSykpOwo+ICB9Cj4gLU5PS1BST0JFX1NZTUJP
TChwYXRjaF9tYXApOwo+ICAKPiAgc3RhdGljIHZvaWQgcGF0Y2hfdW5tYXAoaW50IGZpeG1hcCkK
PiAgewo+IC0tIAo+IDIuNy40Cj4gCgoKLS0gCk1hc2FtaSBIaXJhbWF0c3UgPG1oaXJhbWF0QGtl
cm5lbC5vcmc+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
