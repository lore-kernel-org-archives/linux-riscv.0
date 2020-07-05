Return-Path: <SRS0=/pGw=AQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 833EEC433E0
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Jul 2020 14:16:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FEAD2068F
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Jul 2020 14:16:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2jv99iui";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="wNxfg/1U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4FEAD2068F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=al8bOpB1tmtewg7K2NquG+h8VPuyrRKl+movJlVJv/o=; b=2jv99iuiJAeco3+Tv0yVXjK49
	m68KpvYbM2Saa+jBpgRR5myYA5zaOXz1Z2xHl2822nmvLU5FnXULKfiCx0goXv8V37tLofE34k3k/
	gq8ZsuftEQEBYcuzgkMv1GWCPcWHICWLISs+rmFyU5o2HkhgaslpFEYzDKOIBLyaawRzgNi6PsLjW
	q1w8ND9mZlSTeIV/64xm4uKkTqrjO+epKlrs29nCXIgWtfjq6cLiA4D1XIfCeb8IJ08/9+ngmcEkG
	EzDjvief97+T8HOLlJIQ2kHaGrC6H2qQwU90xKRKbp4wZgeJzH2VbWYWo8IDGV6iRLpi5kbIWkYs3
	BPCzx3J1w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1js5Ro-00076r-VS; Sun, 05 Jul 2020 14:16:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1js5Rn-00076R-ES
 for linux-riscv@lists.infradead.org; Sun, 05 Jul 2020 14:16:48 +0000
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6C5212073E
 for <linux-riscv@lists.infradead.org>; Sun,  5 Jul 2020 14:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593958606;
 bh=Wz6tmJZ7X6vLJFgWNa4oF4UuJ7+Eb1kGF2rczNiaB5g=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=wNxfg/1Up8+BxqKyV4PEryq1tPkSh7vbPgexQtXIVvjojCCCciH8luyl5fAql408n
 mT/4u8DW3Y86sEydZOjY3gs7GJDrdzyvvr9XQdwIIbn0u9j1kr7Z/Oi6Q2+NgDS3Zj
 dt9zg1YZbbunH6vmQEAkO6GpjY8pgz1/LxPazBGg=
Received: by mail-lj1-f173.google.com with SMTP id b25so38655223ljp.6
 for <linux-riscv@lists.infradead.org>; Sun, 05 Jul 2020 07:16:46 -0700 (PDT)
X-Gm-Message-State: AOAM533u9BD0RHRB4n91uq0tmurHkReTr1oaGqFfBG5761FQQL5pt8DD
 vF8BUfj7C9hEyWUFGXqsclxDJ/dkE78Gx3syM/E=
X-Google-Smtp-Source: ABdhPJzOPwNtu8aM2X+c8NB4WS8eePD9/vHUi3xAaqCbYxF0wbpU9DWEDf+I1RNMWWggfT6/FhQ05llzyWCn/y8YIiA=
X-Received: by 2002:a2e:7e08:: with SMTP id z8mr19960078ljc.66.1593958604762; 
 Sun, 05 Jul 2020 07:16:44 -0700 (PDT)
MIME-Version: 1.0
References: <1593930255-12378-1-git-send-email-guoren@kernel.org>
 <202007042350.4C153C4F8@keescook>
In-Reply-To: <202007042350.4C153C4F8@keescook>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 5 Jul 2020 22:16:14 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQFqH7GMvRgmtb=hBwvUy6NZyM8xLqOsUTvnYhO48tQbg@mail.gmail.com>
Message-ID: <CAJF2gTQFqH7GMvRgmtb=hBwvUy6NZyM8xLqOsUTvnYhO48tQbg@mail.gmail.com>
Subject: Re: [PATCH] riscv: Add STACKPROTECTOR supported
To: Kees Cook <keescook@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200705_101647_618834_A54E9E96 
X-CRM114-Status: GOOD (  30.63  )
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
Cc: Guo Ren <guoren@linux.alibaba.com>, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, Atish Patra <atish.patra@wdc.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Masami Hiramatsu <mhiramat@kernel.org>,
 Zong Li <zong.li@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Greentime Hu <green.hu@gmail.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgS2VlcywKCk9uIFN1biwgSnVsIDUsIDIwMjAgYXQgMjo1MyBQTSBLZWVzIENvb2sgPGtlZXNj
b29rQGNocm9taXVtLm9yZz4gd3JvdGU6Cj4KPiBPbiBTdW4sIEp1bCAwNSwgMjAyMCBhdCAwNjoy
NDoxNUFNICswMDAwLCBndW9yZW5Aa2VybmVsLm9yZyB3cm90ZToKPiA+IEZyb206IEd1byBSZW4g
PGd1b3JlbkBsaW51eC5hbGliYWJhLmNvbT4KPiA+Cj4gPiBUaGUgLWZzdGFjay1wcm90ZWN0b3Ig
JiAtZnN0YWNrLXByb3RlY3Rvci1zdHJvbmcgZmVhdHVyZXMgYXJlIGZyb20KPiA+IGdjYy4gVGhl
IHBhdGNoIG9ubHkgYWRkIGJhc2ljIGtlcm5lbCBzdXBwb3J0IHRvIHN0YWNrLXByb3RlY3Rvcgo+
ID4gZmVhdHVyZSBhbmQgc29tZSBhcmNoIGNvdWxkIGhhdmUgaXRzIG93biBzb2x1dGlvbiBzdWNo
IGFzCj4gPiBBUk02NF9QVFJfQVVUSC4KPiA+Cj4gPiBBZnRlciBlbmFibGluZyBTVEFDS1BST1RF
Q1RPUiBhbmQgU1RBQ0tQUk9URUNUT1JfU1RST05HLCB0aGUgLnRleHQKPiA+IHNpemUgaXMgZXhw
YW5kZWQgZnJvbSAgMHg3ZGUwNjYgdG8gMHg4MWZiMzIgKG9ubHkgNSUpIHRvIGFkZCBjYW5hcnkK
PiA+IGNoZWNraW5nIGNvZGUuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVu
QGxpbnV4LmFsaWJhYmEuY29tPgo+ID4gQ2M6IFBhdWwgV2FsbXNsZXkgPHBhdWwud2FsbXNsZXlA
c2lmaXZlLmNvbT4KPiA+IENjOiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyZGFiYmVsdEBnb29nbGUu
Y29tPgo+ID4gQ2M6IEFsYmVydCBPdSA8YW91QGVlY3MuYmVya2VsZXkuZWR1Pgo+ID4gQ2M6IE1h
c2FtaSBIaXJhbWF0c3UgPG1oaXJhbWF0QGtlcm5lbC5vcmc+Cj4gPiBDYzogQmrDtnJuIFTDtnBl
bCA8Ympvcm4udG9wZWxAZ21haWwuY29tPgo+ID4gQ2M6IEdyZWVudGltZSBIdSA8Z3JlZW4uaHVA
Z21haWwuY29tPgo+ID4gQ2M6IEF0aXNoIFBhdHJhIDxhdGlzaC5wYXRyYUB3ZGMuY29tPgo+ID4g
LS0tCj4gPiAgYXJjaC9yaXNjdi9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwo+
ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vc3RhY2twcm90ZWN0b3IuaCB8IDI5ICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrCj4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvcHJvY2Vzcy5jICAg
ICAgICAgICAgIHwgIDYgKysrKysrCj4gPiAgMyBmaWxlcyBjaGFuZ2VkLCAzNiBpbnNlcnRpb25z
KCspCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vc3RhY2tw
cm90ZWN0b3IuaAo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L0tjb25maWcgYi9hcmNo
L3Jpc2N2L0tjb25maWcKPiA+IGluZGV4IGY5MjdhOTEuLjRiMGUzMDggMTAwNjQ0Cj4gPiAtLS0g
YS9hcmNoL3Jpc2N2L0tjb25maWcKPiA+ICsrKyBiL2FyY2gvcmlzY3YvS2NvbmZpZwo+ID4gQEAg
LTYzLDYgKzYzLDcgQEAgY29uZmlnIFJJU0NWCj4gPiAgICAgICBzZWxlY3QgSEFWRV9QRVJGX0VW
RU5UUwo+ID4gICAgICAgc2VsZWN0IEhBVkVfUEVSRl9SRUdTCj4gPiAgICAgICBzZWxlY3QgSEFW
RV9QRVJGX1VTRVJfU1RBQ0tfRFVNUAo+ID4gKyAgICAgc2VsZWN0IEhBVkVfU1RBQ0tQUk9URUNU
T1IKPiA+ICAgICAgIHNlbGVjdCBIQVZFX1NZU0NBTExfVFJBQ0VQT0lOVFMKPiA+ICAgICAgIHNl
bGVjdCBJUlFfRE9NQUlOCj4gPiAgICAgICBzZWxlY3QgTU9EVUxFU19VU0VfRUxGX1JFTEEgaWYg
TU9EVUxFUwo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc3RhY2twcm90
ZWN0b3IuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc3RhY2twcm90ZWN0b3IuaAo+ID4gbmV3
IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4IDAwMDAwMDAwLi41OTYyZjg4Cj4gPiAtLS0gL2Rl
di9udWxsCj4gPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3N0YWNrcHJvdGVjdG9yLmgK
PiA+IEBAIC0wLDAgKzEsMjkgQEAKPiA+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BM
LTIuMCAqLwo+ID4gKwo+ID4gKyNpZm5kZWYgX0FTTV9SSVNDVl9TVEFDS1BST1RFQ1RPUl9ICj4g
PiArI2RlZmluZSBfQVNNX1JJU0NWX1NUQUNLUFJPVEVDVE9SX0gKPiA+ICsKPiA+ICsjaW5jbHVk
ZSA8bGludXgvcmFuZG9tLmg+Cj4gPiArI2luY2x1ZGUgPGxpbnV4L3ZlcnNpb24uaD4KPiA+ICsK
PiA+ICtleHRlcm4gdW5zaWduZWQgbG9uZyBfX3N0YWNrX2Noa19ndWFyZDsKPiA+ICsKPiA+ICsv
Kgo+ID4gKyAqIEluaXRpYWxpemUgdGhlIHN0YWNrcHJvdGVjdG9yIGNhbmFyeSB2YWx1ZS4KPiA+
ICsgKgo+ID4gKyAqIE5PVEU6IHRoaXMgbXVzdCBvbmx5IGJlIGNhbGxlZCBmcm9tIGZ1bmN0aW9u
cyB0aGF0IG5ldmVyIHJldHVybiwKPiA+ICsgKiBhbmQgaXQgbXVzdCBhbHdheXMgYmUgaW5saW5l
ZC4KPiA+ICsgKi8KPiA+ICtzdGF0aWMgX19hbHdheXNfaW5saW5lIHZvaWQgYm9vdF9pbml0X3N0
YWNrX2NhbmFyeSh2b2lkKQo+ID4gK3sKPiA+ICsgICAgIHVuc2lnbmVkIGxvbmcgY2FuYXJ5Owo+
ID4gKwo+ID4gKyAgICAgLyogVHJ5IHRvIGdldCBhIHNlbWkgcmFuZG9tIGluaXRpYWwgdmFsdWUu
ICovCj4gPiArICAgICBnZXRfcmFuZG9tX2J5dGVzKCZjYW5hcnksIHNpemVvZihjYW5hcnkpKTsK
PiA+ICsgICAgIGNhbmFyeSBePSBMSU5VWF9WRVJTSU9OX0NPREU7Cj4gPiArICAgICBjYW5hcnkg
Jj0gQ0FOQVJZX01BU0s7Cj4KPiBEb2VzIHJpc2N2IGhhdmUgYW55IGtpbmQgb2YgaW5zdHJ1Y3Rp
b24gY291bnRlcnMgb3Igb3RoZXIgdHJpdmlhbCB0aW1lcnMKPiB0aGF0IGNvdWxkIGJlIG1peGVk
IGluIGhlcmU/IChlLmcuIHg4NidzIFRTQykKRG8geW91IG1lYW46CiAgZ2V0X3JhbmRvbV9ieXRl
cygmY2FuYXJ5LCBzaXplb2YoY2FuYXJ5KSk7CisgY2FuYXJ5ICs9IGdldF9jeWNsZXM2NCgpICsg
KGdldF9jeWNsZXM2NCgpIDw8IDMyVUwpOwogIGNhbmFyeSBePSBMSU5VWF9WRVJTSU9OX0NPREU7
CiAgY2FuYXJ5ICY9IENBTkFSWV9NQVNLOwoKT2sgPwoKPgo+ID4gKwo+ID4gKyAgICAgY3VycmVu
dC0+c3RhY2tfY2FuYXJ5ID0gY2FuYXJ5Owo+ID4gKyAgICAgX19zdGFja19jaGtfZ3VhcmQgPSBj
dXJyZW50LT5zdGFja19jYW5hcnk7Cj4KPiBXaGF0J3MgbmVlZGVkIGZvciByaXNjdiB0byBzdXBw
b3J0IGEgcGVyLXRhc2sgY2FuYXJ5PyAoZS5nLiB4ODYncyBUTFMgb3IKPiBhcm02NCdzIHJlZ2lz
dGVyLXNwZWNpZmljIG1ldGhvZHMpClNvbWUgYXJjaHMgY2hhbmdlIF9fc3RhY2tfY2hrX2d1YXJk
IGluIF9zd2l0Y2hfdG8gb2YgZW50cnkuUywgYnV0IGl0CmRlcGVuZHMgb24gIUNPTkZJR19TTVAu
CgojaWYgZGVmaW5lZChDT05GSUdfU1RBQ0tQUk9URUNUT1IpICYmICFkZWZpbmVkKENPTkZJR19T
TVApCiAgICAgICAgZ2V0ICB2YWx1ZSAgZnJvbSBuZXh0X3Rhc2stPnN0YWNrX2NhbmFyeQogICAg
ICAgIHN0b3JlICB2YWx1ZSB0byBfX3N0YWNrX2Noa19ndWFyZAojZW5kaWYKCkl0J3MgYSBzbyBs
aW1pdGF0aW9uIHNvbHV0aW9uIGZvciBwZXItdGFzayBjYW5hcnksIHNvIEkgZGlkbid0IGNvcHkg
aXQKaW50byByaXNjdj8KCkZvciB0aGUgcmVnaXN0ZXItc3BlY2lmaWMsIEkgcHJlZmVyIGFybTY0
J3MgdGhlbiB4ODYsIGxldCdzIGNvbnRpbnVlCnRhbGsgaW4gdGhpcyBtYWlsIHRocmVhZDoKCmh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzE1OTM5NTgzOTctNjI0NjYtMS1naXQt
c2VuZC1lbWFpbC1ndW9yZW5Aa2VybmVsLm9yZy9ULyN1Cgo+Cj4gPiArfQo+ID4gKyNlbmRpZiAv
KiBfQVNNX1JJU0NWX1NUQUNLUFJPVEVDVE9SX0ggKi8KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L2tlcm5lbC9wcm9jZXNzLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9jZXNzLmMKPiA+IGlu
ZGV4IDgyNGQxMTcuLjY1NDg5MjkgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9w
cm9jZXNzLmMKPiA+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3Byb2Nlc3MuYwo+ID4gQEAgLTI0
LDYgKzI0LDEyIEBACj4gPgo+ID4gIHJlZ2lzdGVyIHVuc2lnbmVkIGxvbmcgZ3BfaW5fZ2xvYmFs
IF9fYXNtX18oImdwIik7Cj4gPgo+ID4gKyNpZmRlZiBDT05GSUdfU1RBQ0tQUk9URUNUT1IKPiA+
ICsjaW5jbHVkZSA8bGludXgvc3RhY2twcm90ZWN0b3IuaD4KPiA+ICt1bnNpZ25lZCBsb25nIF9f
c3RhY2tfY2hrX2d1YXJkIF9fcmVhZF9tb3N0bHk7Cj4gPiArRVhQT1JUX1NZTUJPTChfX3N0YWNr
X2Noa19ndWFyZCk7Cj4gPiArI2VuZGlmCj4gPiArCj4gPiAgZXh0ZXJuIGFzbWxpbmthZ2Ugdm9p
ZCByZXRfZnJvbV9mb3JrKHZvaWQpOwo+ID4gIGV4dGVybiBhc21saW5rYWdlIHZvaWQgcmV0X2Zy
b21fa2VybmVsX3RocmVhZCh2b2lkKTsKPiA+Cj4gPiAtLQo+ID4gMi43LjQKPiA+Cj4KPiBCdXQg
eWVzLCBhcyBhIHN0YXJ0aW5nIHBvaW50LCBiZXR0ZXIgdG8gaGF2ZSBhIHNpbmdsZSBwZXItYm9v
dCBnbG9iYWwKPiBjYW5hcnkgdGhhbiBub25lIGF0IGFsbC4gOikKPgo+IFJldmlld2VkLWJ5OiBL
ZWVzIENvb2sgPGtlZXNjb29rQGNocm9taXVtLm9yZz4KVGhhbmsgeW91IDopCgotLQpCZXN0IFJl
Z2FyZHMKIEd1byBSZW4KCk1MOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1jc2t5LwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
