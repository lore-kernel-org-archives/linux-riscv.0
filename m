Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2065FC43458
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 07:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mz2cLapKc8WwhGn32POvzOZhkwdvaXPv6c7CJYp7ESA=; b=rc2np1X1IrufJ6
	2zOgcKnjWMDi8p0Zl05LmwFxikWaD+1UNLOGJEpWtbIu+QSf8X69M8Redgtrtrrs5sDFaraclnOEt
	0GmPjeocMTf6dfjQohZ8f1lb/gOnmDNmGTkWsbf17WPmnoBbcmkFrRfogZSbEf9X+OjfqmeRkol7O
	2GsiBb3d/TSsFsSmmFL8sWUxHprnN6zrtsSyTTNM4bz0oDJQp/jE5Si0sOMB5SKDpRsArA7xDbKPP
	xNlXVpJvIO7p1AsciWIgCgID7KMlHGG9yjMwOjCnNYPdDMyjUqTT7fKJV35tfJhCwgVcJjKzkzmrU
	Neeza+hyj3AItYvmfd5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfYQ4-00000006HAs-472A;
	Fri, 03 Jul 2026 07:34:40 +0000
Received: from smtpbguseast1.qq.com ([54.204.34.129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfYQ1-00000006H9Z-2HUE
	for linux-riscv@lists.infradead.org;
	Fri, 03 Jul 2026 07:34:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1783063977;
	bh=gXWkF2A3mVJNbYSFCvL2F0a8Ahpma+Tai1aJtrIXBG0=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=BDxmDcrTOxRB3rBaRjVKgRQ9s5puQT4DB3Uizm8Tj2AbAfUpG1Cl0lmnMD6FgWTri
	 eioeYVC4XzC/zigZPyfSHK/rZBoCmLnLICledgObH+t5Xdd04FEu01BNeX4jxT4Gql
	 5Y0TMo+JedH7+0o4TRKfOMqaq93na1DD9VTMr4kY=
X-QQ-mid: zesmtpsz6t1783063975t45f54373
X-QQ-Originating-IP: KFX4Gg3zb2MFVXa9zz+DeslXJr8n6gEqmyJWIeDTwM8=
Received: from [127.0.0.1] ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 03 Jul 2026 15:32:51 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16044455994702524684
Message-ID: <138BCDE3F4A1D624+2488a822-cf77-4155-8492-b8a1c47d5589@linux.spacemit.com>
Date: Fri, 3 Jul 2026 15:32:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/12] rvtrace: Initial implementation of driver
 framework
To: Greg KH <gregkh@linuxfoundation.org>
Cc: anup.patel@oss.qualcomm.com, adrian.hunter@intel.com, alex@ghiti.fr,
 alexander.shishkin@linux.intel.com, andrew.jones@oss.qualcomm.com,
 anup@brainfault.org, atish.patra@linux.dev, conor+dt@kernel.org,
 devicetree@vger.kernel.org, irogers@google.com, jolsa@kernel.org,
 krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, mark.rutland@arm.com,
 mayuresh.chitale@oss.qualcomm.com, mchitale@gmail.com, mingo@redhat.com,
 namhyung@kernel.org, palmer@dabbelt.com, peterz@infradead.org,
 pjw@kernel.org, robh@kernel.org, sunilvl@oss.qualcomm.com
References: <20260429125135.1983498-3-anup.patel@oss.qualcomm.com>
 <BDD9553502347B02+ee3069d3-eb04-4a37-b364-107cf8d0653c@linux.spacemit.com>
 <2026070316-surgery-unneeded-bceb@gregkh>
From: Zane Leung <liangzhen@linux.spacemit.com>
In-Reply-To: <2026070316-surgery-unneeded-bceb@gregkh>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: OKkKo7I1HxIe7dDN8bteV9gKWdb8stPzU1fGn8e6mkHClPS8EOnZnddN
	0v7qvv2sF9IWVMuh5G8PPjSCxFy63AUajVWfnhnln+hx4eZ47OWQgHAm2DzXAZrwS8ayeL4
	IkS/WtM1fTL+Y1nfgrJ+uX7hTi8TTOitFio2voIBLB3a0R+FjtdYhNeZKo2Y2MevXsqPf8v
	a5Ej8N3EEvgfg9Z2ynlCRmCDKVZb+G0mXM3Zv/M0imNu5vkEbWtw2TcLFZ5FbIGLEBrzDJW
	fGanbZbYlfzVyzSoVTHochze0cNaEZyM3ua/4StBxUX9+rPFpJY6uzlRwnLwJN0YlBO3OvV
	WGmM25oq/7PKBJxfqgLq39+m0n3un/q/TzgK50hlqeSgnc6hlxKIR+Dyx5vNQFfcFQ72ZNG
	iBp/R4p3qHZ/1ztCjefq7Gl5hdt+echbaSPHEy0dmOzhHQ/LGUp3FPXdaSpB2IblEqakipa
	skSfLJXe2wfI1U3MP3DrDH9pHuh73Gcb2L3yBnRqeKfccUS7zbTb6+ZOpjxqZ0G1v9yxMgA
	E4cKOvdCmkXhrGSe6HIJ3LK0M3Yt08n2dfVXgN5yvAf/TZHEmft/06F/CH18HXX96mJ3jWF
	Pob32vcRplpHse3cqFsMLCHNe0KZcq11FYUeUb04XXf3a3hqj7fEdgBGiEReuOA5o71YlJW
	W7z2seEPiB4eakdARVPZ9oDAMjdh70NQFyy8WkbamUkLMZEAWvFv+vX3t1FHVshK0ACsbVV
	T1kf39LBnfwr48RQdZdgNdE1ZvkeONwTtrL1BjUCKhAom+eyISnZLfr4EkxWbkEZAGzk8EJ
	wcQDvA01KixHWZtrNha8Px//DROg+fklCuWXHG3DRxXPJAYXsRYpO0N0F1jmMwQ2FQ3oKtX
	j1Pdk7OfNwIYFLfuu6SyJ8w9jqQnrox3ovdq92x9M22rHqgHhbsn9coZJ8u7seZyfLFhNbf
	mgoYSm+yRYZ6KjdkWqsUjjahSSetC2a0DPIA5ZJFCGLCTUrXECtS0CdYKyjf7z8UIB0si2s
	XQnorDDUClWI24e9tpm03gVqkhypHwe/XtYRecIdjRIWwi7HEcFLnntTuV3VZFitN4Ww7LV
	vh9H267XLnJ5BmYbGELNug=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_003438_392427_30B2DD7D 
X-CRM114-Status: UNSURE (   7.25  )
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

Ck9uIDcvMy8yMDI2IDE6NDEgUE0sIEdyZWcgS0ggd3JvdGU6Cj4gT24gVGh1LCBKdWwgMDIsIDIw
MjYgYXQgMDQ6MTk6NTNQTSArMDgwMCwgWmFuZSBMZXVuZyB3cm90ZToKPj4gSGkswqAKPj4KPj4g
QmFzZWQgb24gdGhlIGN1cnJlbnQgZnJhbWV3b3JrLCBJIGFtIGNvbmNlcm5lZCBhYm91dCBob3cg
dG8gc3VwcG9ydCBSSVNDLVYgQVRCIGFuZCByZXVzZSB0aGUgQ29yZXNpZ2h0IGNvbXBvbmVudCAo
RVRCL3RtYy9UUElVKSBpbiB0aGUgZnV0dXJlLgo+IFRoYXQgaXMgdmVyeSB2YWd1ZS4gIFBsZWFz
ZSBwcm92aWRlIHNwZWNpZmljIGV4YW1wbGVzLgoKQWNjb3JkaW5nIHRvIHRoZSAvdHJhY2UgY29u
dHJvbCBpbnRlcmZhY2UvwqBbMV0gc3BlYzogIlRoZSBBVEIgQnJpZGdlIGFsbG93cyBzZW5kaW5n
IFJJU0MtViB0cmFjZSB0byBBcm0gQ29yZVNpZ2h0wqAKCmluZnJhc3RydWN0dXJlIChpbnN0ZWFk
IG9mIFJJU0MtViBjb21wbGlhbnQgc2luayBkZWZpbmVkIGluIHRoaXMgZG9jdW1lbnQpIGFzIGFu
IEFUQiBpbml0aWF0b3IuIEFUQiBCcmlkZ2UgaXMgbm90wqAKCm5lZWRlZCBmb3IgUklTQy1WIG9u
bHkgc3lzdGVtcy4iCgpGb3IgQVRCIEJyaWRnZSwgcmVhZCB0cmFjZSB1c2luZyBDb3Jlc2lnaHQg
Y29tcG9uZW50cyAoRVRCL1RNQy9UUElVKSzCoCBzbyB3ZSBuZWVkIGFsc28gQVJNIGNvcmVzaWdo
dCBkcml2ZXIgaW4KUklTQy1WIHRyYWNlIHN5c3RlbXMuIEN1cnJlbnQgZnJhbWV3b3JrIHNlZW1z
IHRvIG9ubHkgYmUgYXBwbGljYWJsZSB0b8KgUklTQy1WIG9ubHkgc3lzdGVtcywgYW5kIGRvZXMg
bm90IHN1cHBvcnQKQVRCIGFuZMKgwqBBUk0gY29yZXNpZ2h0wqB1c2UgY2FzZSBsaWtlIHRoZSBL
MyAoSzMgU29DIGNvbnRhaW5zIFJJU0MtViBFbmNvZGVyLCBGdW5uZWwsIEFUQiwgQ29yZVNpZ2h0
IEZ1bm5lbCwgYW5kwqAKCkNvcmVTaWdodCBUTUMgY29tcG9uZW50cykuIEZvciBtb3JlIGRpc2N1
c3Npb24sIHBsZWFzZSByZWZlciB0byBbMl0uCgoKWzFdOiBodHRwczovL2RvY3MucmlzY3Yub3Jn
L3JlZmVyZW5jZS90cmFjZS1jb250cm9sLWludGVyZmFjZS92MS4wL3RjaV9zeXN0ZW1fb3ZlcnZp
ZXcuaHRtbCNhdGItYnJpZGdlClsyXTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjYw
NDE0MDM0MTUzLjMyNzI0ODUtMS1saWFuZ3poZW5AbGludXguc3BhY2VtaXQuY29tLwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
