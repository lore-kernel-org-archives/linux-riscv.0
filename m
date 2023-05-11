Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B11ACC77B7C
	for <linux-riscv@archiver.kernel.org>; Thu, 11 May 2023 09:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vz5P4Zx1nRPWGDHYybhUbDTzpebWMq8REsHyR2XxqFE=; b=fj4xxkaQB3eAaz
	c0Da45PdAwggelsSIP3KzOGZ/9eVXJwabyOmagICHG3ULB2qW1BfIbH50jt+CjJZXjF6+43J6XOFB
	Sd8K0y0PjSwJ7hL6Mroo70OjYa14W2+gZxlb9X8b0v9pg7foOUpqAARjpuLFEPkXOx1xzMt1l5sp8
	pz0xDykfGew6Cthh9gT2r9hLqMQhbUdjAmeOITKS4V5rGBHh/bc4QyAOC9dMbALm7VnuayqgZqlC6
	rr5JPWKewl2S7zB7zxLPmI9XqhSvfrZj9cJyaKyR9GJDPRwlGkC8YVzAn0RVeAm6QZzGLyAjtXhJJ
	hvPdJJRNV9SdjxDH7a+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px2Rc-008KPY-19;
	Thu, 11 May 2023 09:18:40 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px2RY-008KO3-2Q
	for linux-riscv@lists.infradead.org;
	Thu, 11 May 2023 09:18:39 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-643912bca6fso6666974b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 11 May 2023 02:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683796712; x=1686388712;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i6U9uGUr88pwOkY4LrqlN7HlhZaxZaBxyK1VEGjXGAo=;
        b=OS//Vh11EEv2pGSkeRLlqnJLTlOW5TJGhs3rLBeTcNVdkcic6iBLPL9Fn6RdPmOM6V
         zCK2oulh9Kb1YGuv6W1jBADS5lnSMnj1dNT7GW4Or0906FuRNjrkl7N/ZQ9iOEqQvpcR
         DpcQdwrUEX6ghH3jdKX9JXzjMmCaecmqwx/l+cUq8oy33lI1pYigcCAmvHx3FiMKe0vQ
         35LoPTwhQZHB9NaUWt5sjGaq/QnmGb9TINVFwOyWc/teIlGRxwyq60cUojFvAHpZzhwF
         2OIVE+dcScqo3cGGi8YXR9SI5LnFG5YSoKoiDhsENGTs3szAkIeuSstLr6RVro62/ln8
         +aZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683796712; x=1686388712;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i6U9uGUr88pwOkY4LrqlN7HlhZaxZaBxyK1VEGjXGAo=;
        b=WcdSyTROpUG7xfXwdaEtQyFXNYD3FZAaWENnBCQB8h572BcGfK38LcXn/e8I30vxr8
         hgvxasBNeARJpMbXq9KYup0XX5/9imH5lncgGIX2L7z3XWD2BpQM6tQyUe57xUrZXYh3
         BgVpOxxmwcdBbFo8B0N0M/75fydGU9cQd1qTPe8Mxk3muV+tM3PliylmLeb2aj3R4xqF
         sTMLYusgg7qW3nHKBuQGK2uWA5lpUMMl2v0wLphTCP2dUg549ZRQ6ipnCUKCquVolTW9
         VtzykBvPM6eCNyjUaoUr8if4AsKmusPkzeK+udcB7RLzOe3STBbDVcW4mVPdCJ1Q7Dws
         oxZg==
X-Gm-Message-State: AC+VfDy/5h/OtTIc/+GI4VI6FJxsdwhzzLJgVyUWvYZIf1PE954j0nam
	HLJ+yKKbj5ttzRki5UYcHz6NiLn+1EXTWhx0vS0=
X-Google-Smtp-Source: ACHHUZ4qGTyyG/l/JoJuljrxfO4gxHgyL+Cw8GqS43DRhxvfyaXfQcEQGAOjOTqiR4fmrPdGmFx+hH1GryJ1IAa64So=
X-Received: by 2002:a17:902:8348:b0:1ac:9890:1c49 with SMTP id
 z8-20020a170902834800b001ac98901c49mr10124636pln.15.1683796711999; Thu, 11
 May 2023 02:18:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230510101857.2953955-1-suagrfillet@gmail.com>
 <20230510101857.2953955-4-suagrfillet@gmail.com> <87ttwjjpx8.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <87ttwjjpx8.fsf@all.your.base.are.belong.to.us>
From: Song Shuai <suagrfillet@gmail.com>
Date: Thu, 11 May 2023 09:18:19 +0000
Message-ID: <CAAYs2=gKa71k81NfvbHknQuSgOTNXqTaGPVghjU__WvVDq_8uA@mail.gmail.com>
Subject: Re: [PATCH V9 3/4] riscv: ftrace: Add DYNAMIC_FTRACE_WITH_DIRECT_CALLS
 support
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	rostedt@goodmis.org, mhiramat@kernel.org, mark.rutland@arm.com, 
	guoren@kernel.org, jszhang@kernel.org, e.shatokhin@yadro.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_021836_787950_DFE23A4C 
X-CRM114-Status: GOOD (  25.25  )
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

QmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4g5LqOMjAyM+W5tDXmnIgxMeaXpeWRqOWb
myAwNzoxOeWGmemBk++8mgoKPgo+IFNvbmcgU2h1YWkgPHN1YWdyZmlsbGV0QGdtYWlsLmNvbT4g
d3JpdGVzOgo+Cj4gPiBUaGlzIHBhdGNoIGFkZHMgRFlOQU1JQ19GVFJBQ0VfV0lUSF9ESVJFQ1Rf
Q0FMTFMgc3VwcG9ydCBmb3IgUklTQy1WLgo+ID4KPiA+IHNlbGVjdCB0aGUgRFlOQU1JQ19GVFJB
Q0VfV0lUSF9ESVJFQ1RfQ0FMTFMgdG8gcHJvdmlkZSB0aGUKPiA+IHJlZ2lzdGVyX2Z0cmFjZV9k
aXJlY3RbX211bHRpXSBpbnRlcmZhY2VzIGFsbG93aW5nIHVzZXJzIHRvIHJlZ2lzdGVyCj4gPiB0
aGUgY3VzdG9tZWQgdHJhbXBvbGluZSAoZGlyZWN0X2NhbGxlcikgYXMgdGhlIG1jb3VudCBmb3Ig
b25lIG9yCj4gPiBtb3JlIHRhcmdldCBmdW5jdGlvbnMuIEFuZCBtb2RpZnlfZnRyYWNlX2RpcmVj
dFtfbXVsdGldIGFyZSBhbHNvCj4gPiBwcm92aWRlZCBmb3IgbW9kaWZ5aW5nIGRpcmVjdF9jYWxs
ZXIuCj4gPgo+ID4gVG8gbWFrZSB0aGUgZGlyZWN0X2NhbGxlciBhbmQgdGhlIG90aGVyIGZ0cmFj
ZSBob29rcyAoZWcuIGZ1bmN0aW9uL2ZncmFwaAo+ID4gdHJhY2VyLCBrW3JldF1wcm9iZXMpIGNv
LWV4aXN0LCBhIHRlbXBvcmFyeSByZWdpc3RlciBpcyBub21pbmF0ZWQgdG8KPiA+IHN0b3JlIHRo
ZSBhZGRyZXNzIG9mIGRpcmVjdF9jYWxsZXIgaW4gZnRyYWNlX3JlZ3NfY2FsbGVyLiBBZnRlciB0
aGUKPiA+IHNldHRpbmcgb2YgdGhlIGFkZHJlc3MgZGlyZWN0X2NhbGxlciBieSBkaXJlY3Rfb3Bz
LT5mdW5jIGFuZCB0aGUKPiA+IFJFU1RPUkVfUkVHUyBpbiBmdHJhY2VfcmVnc19jYWxsZXIsIGRp
cmVjdF9jYWxsZXIgd2lsbCBiZSBqdW1wZWQgdG8KPiA+IGJ5IHRoZSBganJgIGluc3QuCj4gPgo+
ID4gU2lnbmVkLW9mZi1ieTogU29uZyBTaHVhaSA8c3VhZ3JmaWxsZXRAZ21haWwuY29tPgo+ID4g
VGVzdGVkLWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KPiA+IFNpZ25lZC1vZmYtYnk6
IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgo+ID4gLS0tCj4gPiAgYXJjaC9yaXNjdi9LY29u
ZmlnICAgICAgICAgICAgICB8ICAxICsKPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Z0cmFj
ZS5oIHwgIDggKysrKysrKysKPiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC9tY291bnQtZHluLlMgIHwg
MTAgKysrKysrKysrKwo+ID4gIDMgZmlsZXMgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKQo+ID4K
PiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L0tjb25maWcgYi9hcmNoL3Jpc2N2L0tjb25maWcK
PiA+IGluZGV4IGUwNjMyNDkzNDgyZi4uZmRmMGIyMTlhMDJjIDEwMDY0NAo+ID4gLS0tIGEvYXJj
aC9yaXNjdi9LY29uZmlnCj4gPiArKysgYi9hcmNoL3Jpc2N2L0tjb25maWcKPiA+IEBAIC0xNDQs
NiArMTQ0LDcgQEAgY29uZmlnIFJJU0NWCj4gPiAgICAgICBzZWxlY3QgVUFDQ0VTU19NRU1DUFkg
aWYgIU1NVQo+ID4gICAgICAgc2VsZWN0IFpPTkVfRE1BMzIgaWYgNjRCSVQKPiA+ICAgICAgIHNl
bGVjdCBIQVZFX0RZTkFNSUNfRlRSQUNFIGlmICFYSVBfS0VSTkVMICYmIE1NVSAmJiAoQ0xBTkdf
U1VQUE9SVFNfRFlOQU1JQ19GVFJBQ0UgfHwgR0NDX1NVUFBPUlRTX0RZTkFNSUNfRlRSQUNFKQo+
ID4gKyAgICAgc2VsZWN0IEhBVkVfRFlOQU1JQ19GVFJBQ0VfV0lUSF9ESVJFQ1RfQ0FMTFMKPiA+
ICAgICAgIHNlbGVjdCBIQVZFX0RZTkFNSUNfRlRSQUNFX1dJVEhfUkVHUyBpZiBIQVZFX0RZTkFN
SUNfRlRSQUNFCj4gPiAgICAgICBzZWxlY3QgSEFWRV9GVFJBQ0VfTUNPVU5UX1JFQ09SRCBpZiAh
WElQX0tFUk5FTAo+ID4gICAgICAgc2VsZWN0IEhBVkVfRlVOQ1RJT05fR1JBUEhfVFJBQ0VSCj4g
PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9mdHJhY2UuaCBiL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vZnRyYWNlLmgKPiA+IGluZGV4IDg0Zjg1NmEzMjg2ZS4uODQ5MDRjMWU0
MzY5IDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9mdHJhY2UuaAo+ID4g
KysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9mdHJhY2UuaAo+ID4gQEAgLTExNCw2ICsxMTQs
MTQgQEAgc3RydWN0IGZ0cmFjZV9yZWdzOwo+ID4gIHZvaWQgZnRyYWNlX2dyYXBoX2Z1bmModW5z
aWduZWQgbG9uZyBpcCwgdW5zaWduZWQgbG9uZyBwYXJlbnRfaXAsCj4gPiAgICAgICAgICAgICAg
ICAgICAgICBzdHJ1Y3QgZnRyYWNlX29wcyAqb3AsIHN0cnVjdCBmdHJhY2VfcmVncyAqZnJlZ3Mp
Owo+ID4gICNkZWZpbmUgZnRyYWNlX2dyYXBoX2Z1bmMgZnRyYWNlX2dyYXBoX2Z1bmMKPiA+ICsK
PiA+ICtzdGF0aWMgaW5saW5lIHZvaWQKPiA+ICtfX2FyY2hfZnRyYWNlX3NldF9kaXJlY3RfY2Fs
bGVyKHN0cnVjdCBwdF9yZWdzICpyZWdzLCB1bnNpZ25lZCBsb25nIGFkZHIpCj4gPiArewo+ID4g
KyAgICAgICAgICAgICByZWdzLT50MSA9IGFkZHI7Cj4gPiArfQo+ID4gKyNkZWZpbmUgYXJjaF9m
dHJhY2Vfc2V0X2RpcmVjdF9jYWxsZXIoZnJlZ3MsIGFkZHIpIFwKPiA+ICsgICAgIF9fYXJjaF9m
dHJhY2Vfc2V0X2RpcmVjdF9jYWxsZXIoJihmcmVncyktPnJlZ3MsIGFkZHIpCj4gPiAgI2VuZGlm
IC8qIENPTkZJR19EWU5BTUlDX0ZUUkFDRV9XSVRIX1JFR1MgKi8KPiA+Cj4gPiAgI2VuZGlmIC8q
IF9fQVNTRU1CTFlfXyAqLwo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL21jb3Vu
dC1keW4uUyBiL2FyY2gvcmlzY3Yva2VybmVsL21jb3VudC1keW4uUwo+ID4gaW5kZXggZjI2ZTlm
NmUyZmVkLi45ZDQwNWJhZWRiNTIgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9t
Y291bnQtZHluLlMKPiA+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL21jb3VudC1keW4uUwo+ID4g
QEAgLTIzMSw2ICsyMzEsNyBAQCBFTkRQUk9DKGZ0cmFjZV9jYWxsZXIpCj4gPgo+ID4gICNlbHNl
IC8qIENPTkZJR19EWU5BTUlDX0ZUUkFDRV9XSVRIX1JFR1MgKi8KPiA+ICBFTlRSWShmdHJhY2Vf
cmVnc19jYWxsZXIpCj4gPiArICAgICBtb3ZlICAgIHQxLCB6ZXJvCj4KPiBQbGVhc2UgdXNlICJt
diIsIGFuZCBub3QgIm1vdmUiIFsxXS4KV2lsbCBmaXggaXQgdXAgaW4gdGhlIG5leHQgdmVyc2lv
bgo+Cj4gPiAgICAgICBTQVZFX0FCSV9SRUdTIDEKPiA+ICAgICAgIFBSRVBBUkVfQVJHUwo+ID4K
PiA+IEBAIC0yMzksNyArMjQwLDEwIEBAIGZ0cmFjZV9yZWdzX2NhbGw6Cj4gPiAgICAgICBjYWxs
ICAgIGZ0cmFjZV9zdHViCj4gPgo+ID4gICAgICAgUkVTVE9SRV9BQklfUkVHUyAxCj4gPiArICAg
ICBibmV6ICAgIHQxLC5MZGlyZWN0Cj4gPiAgICAgICBqciB0MAo+ID4gKy5MZGlyZWN0Ogo+ID4g
KyAgICAganIgdDEKPgo+IEFnYWluLCB3aGlsZSB5b3UncmUgZG9pbmcgY2hhbmdlcyBoZXJlLCBw
bGVhc2UgdHJ5IHRvIGFsaWduIG9wL29wZXJhbmRzLgo+Cj4gV2VhcmluZyBteSBCUEYgaGF0LCBJ
J20gaGFwcHkgdG8gZmluYWxseSBnZXQgRElSRUNUX0NBTExTIHN1cHBvcnQhCj4KPiBUaGlzIGRv
ZXMgbm90IHRha2UgdGhlIFdJVEhfQ0FMTF9PUFMgYXBwcm9hY2ggTWFyayBzdWdnZXN0ZWQgaW4g
dGhlIHY3Cj4gdGhyZWFkcywgYnV0IGdpdmVuIHRoYXQgdGV4dCBwYXRjaGluZyBzdG9yeSBvbiBS
SVNDLVYgaXMgc3RpbGwgYSBiaXQgc2FkCj4gKGluY29uc2lzdGVuY3kgaW4gdGhlIFJWIHRyZWUs
IG5vIHNwZWNpZmljYXRpb24sIGNhbm5vdCB3b3JrIHdpdGgKPiBwcmVlbXB0LCAuLi4pIEknZCBz
YXkgdGhpcyBhcHByb2FjaCBpcyBPSyBmb3Igbm93LCBhbmQgd2UgY2FuIGNoYW5nZSB0bwo+IFdJ
VEhfQ0FMTF9PUFMgbGF0ZXIgaW4gYSB3aWRlciAibGV0J3MgaW1wcm92ZSBSSVNDLVYgdGV4dHBh
dGNoaW5nIiB3b3JrLgo+Cj4gVGhvdWdodHM/Cj4KPgo+IEJqw7Zybgo+Cj4gWzFdIGh0dHBzOi8v
Z2l0aHViLmNvbS9yaXNjdi1ub24taXNhL3Jpc2N2LWFzbS1tYW51YWwvYmxvYi9tYXN0ZXIvcmlz
Y3YtYXNtLm1kIy1hLWxpc3Rpbmctb2Ytc3RhbmRhcmQtcmlzYy12LXBzZXVkb2luc3RydWN0aW9u
cwoKCgotLQpUaGFua3MsClNvbmcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
