Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8246C43458
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 09:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RfT4KTIEzzJnR+bRRAnw2uuULtKbncdIpSqMlCLoNs4=; b=vYx/sym/4qVybp
	dFfeBol7GiWkOEbc5A8vVL8aJJuJQnLsNWYzKmZClkJtY6FZfg2Cdg5vAN3qyFUwqJLqEL1kEeoQ9
	LbW0tp/+SnIhzK1o1qNHHmiwxkkdTGDyQbxEWHBJr6j0/OMXH/wu8Ffdh+PFcoaxcf3TJn5k0Ddh5
	kKMLcUBD+BnkmWLxEXNHp8WlJZYK6XT4LHYgneLn/Doz9bxualgWke17t3GicxQsZ9uT/Gh2phs/o
	7ye8F5CduwWJwuIEI7JIXkXfGdift4YwnXSg3x3wKkb9sb4Kiy/UaMokDWAvRMGX39yPte7nPVHSQ
	OLc6glA8dhoUR9hBrfPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfZmb-00000006Qrq-137H;
	Fri, 03 Jul 2026 09:02:01 +0000
Received: from smtpbgsg2.qq.com ([54.254.200.128])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfZmX-00000006Qpu-37Sd
	for linux-riscv@lists.infradead.org;
	Fri, 03 Jul 2026 09:02:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1783069258;
	bh=ACCEUgrf7Rylr7BySb8msq185wHVdSwdN7rECIYWapc=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=rXf6EsKhnRNRwEDTiMGCIzJnkKHBwIIBK0VEtl79Q5Nv5C95Z5duGqffJL+IZ2auV
	 WtMo4/dQqmBciVLb95kbyRVjAUNTtRi9KhqmmIP6hgeCGDtXJwH693XNF2USmyI9kk
	 F55b5VGoCAuBfnOOFDNAQK++7VTUfvQFJ5GadYCI=
X-QQ-mid: esmtpsz19t1783069256t01806f06
X-QQ-Originating-IP: n1xI3+mPy6w337/zDxtCYOgr7wkg4ok/SuMAWtj5fe4=
Received: from [127.0.0.1] ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 03 Jul 2026 17:00:52 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12710147850900718341
Message-ID: <4A32964890BBF288+37eaa5a2-eaff-49c4-8501-2b02736f3584@linux.spacemit.com>
Date: Fri, 3 Jul 2026 17:00:51 +0800
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
 <138BCDE3F4A1D624+2488a822-cf77-4155-8492-b8a1c47d5589@linux.spacemit.com>
 <2026070300-submitter-humbly-833a@gregkh>
From: Zane Leung <liangzhen@linux.spacemit.com>
In-Reply-To: <2026070300-submitter-humbly-833a@gregkh>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: ORKp4oz66c+QpuyEN5Oy3eLIbixRXKDrgVeuRkDz15TuPh00a1S2mSyy
	99vextRpKdXsxwkVa8FsoL8Rqd5i2g4rgmV58PhOY7ksd+fqWs7SM2igDyB2ZYaezze49/R
	BAdWtCzxGDddaqwALSSsgYNvKPgtu/HTiBSn/FJ7QaBX+xfHLiQblPv63/70dvfSeTAQzo7
	EMvNqjApWXr8GWiDogKpdpDtKb2Hx+GX5MnYaaQtC6rQnWarCNiPhNm+WERj8CY1eq+Fvtn
	6BJSQDkPCycGz13ojz57OtE0cY7tbzBjmz1D+WN1Ciyb6m58WUrZGm923fkowDo/Bcx1PtJ
	ne+GrlyiQh9w59/qaFUvRK0+FMOplOBDyP2hr0da0Z+YCFb7HzfTBTyLOtXGfJptuosuAVN
	AWjBlFxvI14cTeKICJ49z9xvbVaV8iz3zbiZCVh0eoR6XBSOfs5TIU3Sy3z4sKKqHCQ1VGJ
	GOSizh4RH+/7/Qn38uusDavwDVqMJQhdwF6kReFku9oFCQrNrCTL902fWBAJ/hN5kmPcYL3
	8Ia0NdLpAqdmxRn785XJrCE3RVOk33et5xgp5n+XkCltH2lrGBMRChr0ML9c9MWwzYD6hAH
	qMUDl/B0ps/kabZ9oh60r/yPrH4nqaULUqjBaqmoqfTZPpIis/DmSXE1pM+R+fm2ri57f61
	uewacnTb16cLC0l3Ko4nbI1jqC0LK5FABVArIbTPS80HJ2pWcnc0YVJ5vxN+Y16iFEJVlBV
	kzC7Ptlc3nkJbExrOpsIPVaR7ult+niDbv8N6MzBt3wPudBpGkP8JO7N9KICZ4Kiozbk20b
	rPL7ao5DgPPJ+D/v3MIb8o4Czg39/qjePi4ImxB0vwlD9me0j0x6e3MoO7xkb3NrYpYCUsk
	80sI75I/90MSJMfWKrVtBXbrS2boFzPCQI7S9VIYGtFAqfEKVyJOqfNWXyJg4zzFwZEYgTu
	K14dZv2GOiDXS1bFQsk7ycwqQBmnZepUVPRt2wpJh1NU9p3OE+CC880IvMIcUi/lchPjKfW
	fcelf6biamfA8sljbHMrHmXcUEO5oXBI5kC+ow1214X4QKDmZFmsbTxdld711mqW3NQCKSO
	9Bt2AjybXCgd5OIkH6mnTgm27braUAlc7IYOxFy5iBPF53YYC/wbQtoAG41W3dfS1LIVIwe
	brAus4cLNfHRTaln9dknT8wWx2TxAfGkhXpqqSVT840NKDA=
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_020158_471523_6E7794DF 
X-CRM114-Status: GOOD (  17.45  )
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

Ck9uIDcvMy8yMDI2IDM6NDEgUE0sIEdyZWcgS0ggd3JvdGU6Cj4gT24gRnJpLCBKdWwgMDMsIDIw
MjYgYXQgMDM6MzI6NTBQTSArMDgwMCwgWmFuZSBMZXVuZyB3cm90ZToKPj4gT24gNy8zLzIwMjYg
MTo0MSBQTSwgR3JlZyBLSCB3cm90ZToKPj4+IE9uIFRodSwgSnVsIDAyLCAyMDI2IGF0IDA0OjE5
OjUzUE0gKzA4MDAsIFphbmUgTGV1bmcgd3JvdGU6Cj4+Pj4gSGkswqAKPj4+Pgo+Pj4+IEJhc2Vk
IG9uIHRoZSBjdXJyZW50IGZyYW1ld29yaywgSSBhbSBjb25jZXJuZWQgYWJvdXQgaG93IHRvIHN1
cHBvcnQgUklTQy1WIEFUQiBhbmQgcmV1c2UgdGhlIENvcmVzaWdodCBjb21wb25lbnQgKEVUQi90
bWMvVFBJVSkgaW4gdGhlIGZ1dHVyZS4KPj4+IFRoYXQgaXMgdmVyeSB2YWd1ZS4gIFBsZWFzZSBw
cm92aWRlIHNwZWNpZmljIGV4YW1wbGVzLgo+PiBBY2NvcmRpbmcgdG8gdGhlIC90cmFjZSBjb250
cm9sIGludGVyZmFjZS/CoFsxXSBzcGVjOiAiVGhlIEFUQiBCcmlkZ2UgYWxsb3dzIHNlbmRpbmcg
UklTQy1WIHRyYWNlIHRvIEFybSBDb3JlU2lnaHTCoAo+Pgo+PiBpbmZyYXN0cnVjdHVyZSAoaW5z
dGVhZCBvZiBSSVNDLVYgY29tcGxpYW50IHNpbmsgZGVmaW5lZCBpbiB0aGlzIGRvY3VtZW50KSBh
cyBhbiBBVEIgaW5pdGlhdG9yLiBBVEIgQnJpZGdlIGlzIG5vdMKgCj4+Cj4+IG5lZWRlZCBmb3Ig
UklTQy1WIG9ubHkgc3lzdGVtcy4iCj4+Cj4+IEZvciBBVEIgQnJpZGdlLCByZWFkIHRyYWNlIHVz
aW5nIENvcmVzaWdodCBjb21wb25lbnRzIChFVEIvVE1DL1RQSVUpLMKgIHNvIHdlIG5lZWQgYWxz
byBBUk0gY29yZXNpZ2h0IGRyaXZlciBpbgo+PiBSSVNDLVYgdHJhY2Ugc3lzdGVtcy4gQ3VycmVu
dCBmcmFtZXdvcmsgc2VlbXMgdG8gb25seSBiZSBhcHBsaWNhYmxlIHRvwqBSSVNDLVYgb25seSBz
eXN0ZW1zLCBhbmQgZG9lcyBub3Qgc3VwcG9ydAo+PiBBVEIgYW5kwqDCoEFSTSBjb3Jlc2lnaHTC
oHVzZSBjYXNlIGxpa2UgdGhlIEszIChLMyBTb0MgY29udGFpbnMgUklTQy1WIEVuY29kZXIsIEZ1
bm5lbCwgQVRCLCBDb3JlU2lnaHQgRnVubmVsLCBhbmTCoAo+Pgo+PiBDb3JlU2lnaHQgVE1DIGNv
bXBvbmVudHMpLiBGb3IgbW9yZSBkaXNjdXNzaW9uLCBwbGVhc2UgcmVmZXIgdG8gWzJdLgo+Pgo+
Pgo+PiBbMV06IGh0dHBzOi8vZG9jcy5yaXNjdi5vcmcvcmVmZXJlbmNlL3RyYWNlLWNvbnRyb2wt
aW50ZXJmYWNlL3YxLjAvdGNpX3N5c3RlbV9vdmVydmlldy5odG1sI2F0Yi1icmlkZ2UKPj4gWzJd
OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNjA0MTQwMzQxNTMuMzI3MjQ4NS0xLWxp
YW5nemhlbkBsaW51eC5zcGFjZW1pdC5jb20vCj4gU28sIHdoYXQgc3BlY2lmaWNhbGx5IGRvZXMg
dGhpcyBtZWFuPyAgUGxlYXNlIHByb3ZpZGUgcmV2aWV3IGNvbW1lbnRzCj4gZm9yIHRoZSBjb2Rl
IGl0c2VsZi4KClRoZSBpc3N1ZSBJIHBvaW50ZWQgb3V0IGlzIG5vdCBhYm91dCBzcGVjaWZpYyBs
aW5lcyBvZiBjb2RlLCBidXQgYWJvdXQgdGhlIGVudGlyZSBSaXNjdiB0cmFjZSBkcml2ZXIgcmVn
aXN0cmF0aW9uIGFuZCBidWlsZGluZyBhIHBhdGggZnJvbSBzb3VyY2UgLT4Kc2luayBkaWQgbm90
IHRha2UgaW50byBhY2NvdW50IHRoZSBhcHBsaWNhdGlvbiBvZiBhcm1fY29tZXNpZ2h0LiB0aGUg
Y3VycmVudCBwYXRjaCBzZXQgYXNzdW1lcyBhIHJpZ2lkLCBob21vZ2VuZW91cyBSSVNDLVYtb25s
eSB0b3BvbG9neS4KClNwZWNpZmljYWxseSwgaWYgd2UgaGF2ZSBBUk0gY29yZXNpZ2h0IGNvbXBv
bmVudHMsIGhvdyBjYW4gd2UgcmV1c2UgdGhlbSBsaWtlLCBmdW5uZWwgKGRyaXZlcnMvaHd0cmFj
aW5nL2NvcmVzaWdodC9jb3Jlc2lnaHQtZnVubmVsLmMpICzCoAoKVE1DIChkcml2ZXJzL2h3dHJh
Y2luZy9jb3Jlc2lnaHQvY29yZXNpZ2h0LWZ1bm5lbC5jKSAsIFRQSVUgKGRyaXZlcnMvaHd0cmFj
aW5nL2NvcmVzaWdodC9jb3Jlc2lnaHQtdHBpdS5jKSBhbmQgc28gb24gYmFzZWQgb24gdGhlIGN1
cnJlbnQKCmZyYW1ld29yay4KCgo+Cj4gV2Ugd3JpdGUgY29kZSBmb3Igc3R1ZmYgd2UgaGF2ZSBu
b3csIHRvZGF5LiAgSWYgZnV0dXJlIG5lZWRzIGNoYW5nZSwgd2UKPiBjaGFuZ2UgdGhlIGNvZGUg
dG8gaGFuZGxlIHRoYXQgdGhlbi4KCkkgYmVsaWV2ZSB0aGF0IGlmIHRoZSBiYXNpYyBmcmFtZXdv
cmsgZm9yIFJJU0MtViBkb2VzIG5vdCBjb25zaWRlciBjb21wYXRpYmlsaXR5IHdpdGggQVJNIENv
cmVzaWdodCwgb25jZSB0aGUgZnJhbWV3b3JrIGlzIGZpeGVkLCB0aGVyZSB3aWxsIGJlIGdyZWF0
ZXIgcmVzaXN0YW5jZSB0byBmdXR1cmUgbW9kaWZpY2F0aW9ucy7CoAoKPiBUaGUgb25seSBwcm9i
bGVtIGlzIHdpdGggdXNlci9rZXJuZWwgYXBpcywgdGhvc2UgbmVlZCB0byBiZSBuYWlsZWQgZG93
bgo+IHNvIHRoYXQgdGhleSBkb24ndCBjaGFuZ2UuICBJIGNhbid0IHRlbGwgaGVyZSBpZiB5b3Ug
YXJlIG9ubHkgcmVmZXJyaW5nCj4gdG8gdGhlIGluLWtlcm5lbCBzdHVmZiwgb3IgdXNlci9rZXJu
ZWwgYXBpcywgc29ycnkuCj4KPiB0aGFua3MsCj4KPiBncmVnIGstaAoKCkkgYmVsaWV2ZSB0aGF0
IFJJU0MtViB0cmFjaW5nIGlzIGNvcmVzaWdodC1hbGlrZSwgd2hlcmUgaGF2ZSBlbmNvZGVycy9m
dW5uZWwvc2luay9icmlkZ2UrY29yZXNpZ2h0X2NvbXAuwqAKSSB0aGluayB3ZSBzaG91bGQgYWJz
dHJhY3Qgc29tZSBvZiBDb3JlU2lnaHQncyBjb3JlIGxvZ2ljIHNvIHRoYXQgaXQgY2FuIEJvdGgg
Y29yZXNpZ2h0IGFuZCBydnRyYWNlIGNhbiBiZSByZXVzZWQuCkdlbmVyYWwgbG9naWMgZm9yIGJ1
aWxkaW5nIHBhdGhzIGZyb20gc291cmNlIC0+IFNpbmsgYW5kIHBlcmZfcG11IHNob3VsZCBiZSB1
bml2ZXJzYWwgaW4gY29yZXNpZ2h0L3J2dHJhY2UgYW5kwqAKCmZ1dHVyZSBhcmNoaXRlY3R1cmVz
LsKgCgoKdGhhbmtzLAoKWmFuZQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
