Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 070F3C77B7E
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jun 2023 04:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zSrM2AufBDzehzpXwuFR+uk2dksYqxp3lCRBVFEw8oM=; b=MtBxC39vlcHPo+
	P560dVw/m7kEGTa/bSV303efxjte4sZat82VDb/wfwqFoLW1aIt/yY3ReKlXbfETd3WZbB8J3gPVV
	8Biee5dZI3a8SCS2zSto/fFRINuZDGrDKgEGqvbekoSRTXEtgHtha4gz2OHJ5AOLHfO9p+QIvyDet
	GVTmarWc+6K3l7JTcpIqsEnqaOf9eJJQguC+MF7tMggE5VsJuP9m48U54pVQLnWQG0OeTiC7SJ/sY
	ylnInsl1yZvLub9e3RM8Cy0mv4ldlbUfvn7Wxire+Z/F+DZ8fujgk97MeCeXw2rjgmJ7bh4vwKP1z
	Lpw1gScdOhgNyXq/3R2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4aEf-001xHt-2A;
	Thu, 01 Jun 2023 04:48:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4aEc-001xHR-2f
	for linux-riscv@lists.infradead.org;
	Thu, 01 Jun 2023 04:48:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 665A1640B7
	for <linux-riscv@lists.infradead.org>; Thu,  1 Jun 2023 04:48:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC7BCC433A0
	for <linux-riscv@lists.infradead.org>; Thu,  1 Jun 2023 04:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685594905;
	bh=bpqEso1iBcRwWgH0EcZm9MZonL+OTWvGWjN3oOqfL1w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gKakW1h8oa90rkF3M7EI+9OBVEuVcjWWSjlavShvaKptFWd2NUCt6pqOZBbSb4MKZ
	 RIBZQkeb1qnxSVKEhVRFKJnhXoYotMkI+71hTqw46FgNbgJTgktrKzrjWwHZgwAl9Q
	 /R8IFbydSpO/spodcjO2FQPYuJ9F/7shbrERilMdX173I+kmt+wbG3H7yaxFVYr6oj
	 Qb1I645gOVRnJpY24i14hvjeuUNuPsQhp4nWFHghze9va3PVvjuhVk7vaSWDd58erD
	 3iW+2Efke6L3vxQuXi8dU/9nJumrMLOCh9mwf3UccuUiCaxI5AG/gqMhZosptji/HC
	 IVazESpNVRHcw==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-4f122ff663eso327324e87.2
        for <linux-riscv@lists.infradead.org>; Wed, 31 May 2023 21:48:25 -0700 (PDT)
X-Gm-Message-State: AC+VfDzeW3f33yzbSBD9u5xLd8P8XxIR2wLNsB2y7FVZalbwpEXPd0if
	O+vyzxbS9kslOh8qG9CF29LZC+ceaH4Ewi1BPNg=
X-Google-Smtp-Source: ACHHUZ5nc8fnsEt7aFp9LSrVOxwu3lhK/EnxOMe/+pP9nT7UCS7gXmjq9GCIqt+nrEMUYCCVLZtKNU5xYwooOCJttK8=
X-Received: by 2002:a2e:9ed3:0:b0:2af:2231:94b0 with SMTP id
 h19-20020a2e9ed3000000b002af223194b0mr3332988ljk.19.1685594903793; Wed, 31
 May 2023 21:48:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230523165502.2592-1-jszhang@kernel.org> <20230523165502.2592-2-jszhang@kernel.org>
In-Reply-To: <20230523165502.2592-2-jszhang@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 1 Jun 2023 12:48:12 +0800
X-Gmail-Original-Message-ID: <CAJF2gTT4=i+SQi7ODCuyndTQWJjm8hWwBxEOE_C_iSXyRfDfGA@mail.gmail.com>
Message-ID: <CAJF2gTT4=i+SQi7ODCuyndTQWJjm8hWwBxEOE_C_iSXyRfDfGA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] riscv: move options to keep entries sorted
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_214826_939171_6655C632 
X-CRM114-Status: GOOD (  16.54  )
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

T24gV2VkLCBNYXkgMjQsIDIwMjMgYXQgMToxMOKAr0FNIEppc2hlbmcgWmhhbmcgPGpzemhhbmdA
a2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBSZWNlbnRseSwgc29tZSBjb21taXRzIGJyZWFrIHRoZSBl
bnRyaWVzIG9yZGVyLiBQcm9wZXJseSBtb3ZlIHRoZWlyCj4gbG9jYXRpb25zIHRvIGtlZXAgZW50
cmllcyBzb3J0ZWQuCkFja2VkLWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KCj4KPiBT
aWduZWQtb2ZmLWJ5OiBKaXNoZW5nIFpoYW5nIDxqc3poYW5nQGtlcm5lbC5vcmc+Cj4gLS0tCj4g
IGFyY2gvcmlzY3YvS2NvbmZpZyB8IDEyICsrKysrKy0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwg
NiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3YvS2NvbmZpZyBiL2FyY2gvcmlzY3YvS2NvbmZpZwo+IGluZGV4IDM0OGMwZmExZmM4Yy4uOGY1
NWFhNGFhZTM0IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvS2NvbmZpZwo+ICsrKyBiL2FyY2gv
cmlzY3YvS2NvbmZpZwo+IEBAIC0xMDEsNiArMTAxLDExIEBAIGNvbmZpZyBSSVNDVgo+ICAgICAg
ICAgc2VsZWN0IEhBVkVfQ09OVEVYVF9UUkFDS0lOR19VU0VSCj4gICAgICAgICBzZWxlY3QgSEFW
RV9ERUJVR19LTUVNTEVBSwo+ICAgICAgICAgc2VsZWN0IEhBVkVfRE1BX0NPTlRJR1VPVVMgaWYg
TU1VCj4gKyAgICAgICBzZWxlY3QgSEFWRV9EWU5BTUlDX0ZUUkFDRSBpZiAhWElQX0tFUk5FTCAm
JiBNTVUgJiYgKENMQU5HX1NVUFBPUlRTX0RZTkFNSUNfRlRSQUNFIHx8IEdDQ19TVVBQT1JUU19E
WU5BTUlDX0ZUUkFDRSkKPiArICAgICAgIHNlbGVjdCBIQVZFX0RZTkFNSUNfRlRSQUNFX1dJVEhf
UkVHUyBpZiBIQVZFX0RZTkFNSUNfRlRSQUNFCj4gKyAgICAgICBzZWxlY3QgSEFWRV9GVFJBQ0Vf
TUNPVU5UX1JFQ09SRCBpZiAhWElQX0tFUk5FTAo+ICsgICAgICAgc2VsZWN0IEhBVkVfRlVOQ1RJ
T05fR1JBUEhfVFJBQ0VSCj4gKyAgICAgICBzZWxlY3QgSEFWRV9GVU5DVElPTl9UUkFDRVIgaWYg
IVhJUF9LRVJORUwgJiYgIVBSRUVNUFRJT04KPiAgICAgICAgIHNlbGVjdCBIQVZFX0VCUEZfSklU
IGlmIE1NVQo+ICAgICAgICAgc2VsZWN0IEhBVkVfRlVOQ1RJT05fQVJHX0FDQ0VTU19BUEkKPiAg
ICAgICAgIHNlbGVjdCBIQVZFX0ZVTkNUSU9OX0VSUk9SX0lOSkVDVElPTgo+IEBAIC0xMTAsNyAr
MTE1LDYgQEAgY29uZmlnIFJJU0NWCj4gICAgICAgICBzZWxlY3QgSEFWRV9LUFJPQkVTIGlmICFY
SVBfS0VSTkVMCj4gICAgICAgICBzZWxlY3QgSEFWRV9LUFJPQkVTX09OX0ZUUkFDRSBpZiAhWElQ
X0tFUk5FTAo+ICAgICAgICAgc2VsZWN0IEhBVkVfS1JFVFBST0JFUyBpZiAhWElQX0tFUk5FTAo+
IC0gICAgICAgc2VsZWN0IEhBVkVfUkVUSE9PSyBpZiAhWElQX0tFUk5FTAo+ICAgICAgICAgc2Vs
ZWN0IEhBVkVfTU9WRV9QTUQKPiAgICAgICAgIHNlbGVjdCBIQVZFX01PVkVfUFVECj4gICAgICAg
ICBzZWxlY3QgSEFWRV9QQ0kKPiBAQCAtMTE5LDYgKzEyMyw3IEBAIGNvbmZpZyBSSVNDVgo+ICAg
ICAgICAgc2VsZWN0IEhBVkVfUEVSRl9VU0VSX1NUQUNLX0RVTVAKPiAgICAgICAgIHNlbGVjdCBI
QVZFX1BPU0lYX0NQVV9USU1FUlNfVEFTS19XT1JLCj4gICAgICAgICBzZWxlY3QgSEFWRV9SRUdT
X0FORF9TVEFDS19BQ0NFU1NfQVBJCj4gKyAgICAgICBzZWxlY3QgSEFWRV9SRVRIT09LIGlmICFY
SVBfS0VSTkVMCj4gICAgICAgICBzZWxlY3QgSEFWRV9SU0VRCj4gICAgICAgICBzZWxlY3QgSEFW
RV9TVEFDS1BST1RFQ1RPUgo+ICAgICAgICAgc2VsZWN0IEhBVkVfU1lTQ0FMTF9UUkFDRVBPSU5U
Uwo+IEBAIC0xNDIsMTEgKzE0Nyw2IEBAIGNvbmZpZyBSSVNDVgo+ICAgICAgICAgc2VsZWN0IFRS
QUNFX0lSUUZMQUdTX1NVUFBPUlQKPiAgICAgICAgIHNlbGVjdCBVQUNDRVNTX01FTUNQWSBpZiAh
TU1VCj4gICAgICAgICBzZWxlY3QgWk9ORV9ETUEzMiBpZiA2NEJJVAo+IC0gICAgICAgc2VsZWN0
IEhBVkVfRFlOQU1JQ19GVFJBQ0UgaWYgIVhJUF9LRVJORUwgJiYgTU1VICYmIChDTEFOR19TVVBQ
T1JUU19EWU5BTUlDX0ZUUkFDRSB8fCBHQ0NfU1VQUE9SVFNfRFlOQU1JQ19GVFJBQ0UpCj4gLSAg
ICAgICBzZWxlY3QgSEFWRV9EWU5BTUlDX0ZUUkFDRV9XSVRIX1JFR1MgaWYgSEFWRV9EWU5BTUlD
X0ZUUkFDRQo+IC0gICAgICAgc2VsZWN0IEhBVkVfRlRSQUNFX01DT1VOVF9SRUNPUkQgaWYgIVhJ
UF9LRVJORUwKPiAtICAgICAgIHNlbGVjdCBIQVZFX0ZVTkNUSU9OX0dSQVBIX1RSQUNFUgo+IC0g
ICAgICAgc2VsZWN0IEhBVkVfRlVOQ1RJT05fVFJBQ0VSIGlmICFYSVBfS0VSTkVMICYmICFQUkVF
TVBUSU9OCj4KPiAgY29uZmlnIENMQU5HX1NVUFBPUlRTX0RZTkFNSUNfRlRSQUNFCj4gICAgICAg
ICBkZWZfYm9vbCBDQ19JU19DTEFORwo+IC0tCj4gMi40MC4xCj4KCgotLSAKQmVzdCBSZWdhcmRz
CiBHdW8gUmVuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
