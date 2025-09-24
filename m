Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 876A6CAC5A5
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Sep 2025 13:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vYyCaujoR0sc39HzjxqZqqFzloiO7JLpMQTxIoKiXqE=; b=Q8cpxW8qDsgfHT
	44GpikGx9H7p2pS7i1dvA1CO8dsowwjr66I044gk65PmhBLwP0tgPBD5yxaoibbiJzfY+U/t3PWPm
	rserIvr7zHGpTStPpv/nWZXiqA3i5VlThROeQkzO3YTatMsDwQEQ56WHc1Joplgq4cJz4WzJ+KU6B
	JuRQpkNbdf5l+2QSazBuOWESa9bFGRm/1BueMx66XFN6E7zdHHjN2TFiyg4sbwuD+qSverkwwJ3MB
	U3QjJZpveT5s8+bN2z2Xc3SucUNu42GsELhPJlzQo+7N8XNOyAD36KqGQUCj+du/lyl9fVoFoeEdb
	sd7YQIvR4P2WoAxl07TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1P64-000000001QN-3pmu;
	Wed, 24 Sep 2025 12:59:48 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1P5z-000000001ON-0Evw
	for linux-riscv@lists.infradead.org;
	Wed, 24 Sep 2025 12:59:47 +0000
Received: from mail.andestech.com (ATCPCS31.andestech.com [10.0.1.89])
	by Atcsqr.andestech.com with ESMTPS id 58OCwIeM007328
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 24 Sep 2025 20:58:18 +0800 (+08)
	(envelope-from randolph@andestech.com)
Received: from swlinux02 (10.0.15.183) by ATCPCS31.andestech.com (10.0.1.89)
 with Microsoft SMTP Server id 14.3.498.0; Wed, 24 Sep 2025 20:58:18 +0800
Date: Wed, 24 Sep 2025 20:58:11 +0800
From: Randolph Lin <randolph@andestech.com>
To: Bjorn Helgaas <helgaas@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-pci@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <jingoohan1@gmail.com>, <mani@kernel.org>, <lpieralisi@kernel.org>,
        <kwilczynski@kernel.org>, <robh@kernel.org>, <bhelgaas@google.com>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <alex@ghiti.fr>,
        <aou@eecs.berkeley.edu>, <palmer@dabbelt.com>,
        <paul.walmsley@sifive.com>, <ben717@andestech.com>,
        <inochiama@gmail.com>, <thippeswamy.havalige@amd.com>,
        <namcao@linutronix.de>, <shradha.t@samsung.com>,
        <randolph.sklin@gmail.com>, <tim609@andestech.com>
Subject: Re: [PATCH v3 1/5] PCI: dwc: Skip failed outbound iATU and continue
Message-ID: <aNPq42O1Ml3ppF2M@swlinux02>
References: <20250923113647.895686-2-randolph@andestech.com>
 <20250923144223.GA2032427@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250923144223.GA2032427@bhelgaas>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Originating-IP: [10.0.15.183]
X-DKIM-Results: atcpcs31.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 58OCwIeM007328
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_055943_421506_EA86318A 
X-CRM114-Status: GOOD (  35.61  )
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

SGkgQmpvcm4sCgpTb3JyeSwgSSBmb3Jnb3QgdG8gcmVwbHkgdG8gdGhlIGVtYWlsIGJlZm9yZSBz
ZW5kaW5nIHRoZSBwYXRjaC4KSSBtaXNzZWQgdGhlIGVtYWlsLgoKT24gVHVlLCBTZXAgMjMsIDIw
MjUgYXQgMDk6NDI6MjNBTSAtMDUwMCwgQmpvcm4gSGVsZ2FhcyB3cm90ZToKPiBbRVhURVJOQUwg
TUFJTF0KPiAKPiBPbiBUdWUsIFNlcCAyMywgMjAyNSBhdCAwNzozNjo0M1BNICswODAwLCBSYW5k
b2xwaCBMaW4gd3JvdGU6Cj4gPiBQcmV2aW91c2x5LCBvdXRib3VuZCBpQVRVIHByb2dyYW1taW5n
IGluY2x1ZGVkIHJhbmdlIGNoZWNrcyBiYXNlZAo+ID4gb24gaGFyZHdhcmUgbGltaXRhdGlvbnMu
IElmIGEgY29uZmlndXJhdGlvbiBkaWQgbm90IG1lZXQgdGhlc2UKPiA+IGNvbnN0cmFpbnRzLCB0
aGUgbG9vcCB3b3VsZCBzdG9wIGltbWVkaWF0ZWx5Lgo+ID4KPiA+IFRoaXMgcGF0Y2ggdXBkYXRl
cyB0aGUgYmVoYXZpb3IgdG8gZW5oYW5jZSBmbGV4aWJpbGl0eS4gSW5zdGVhZCBvZgo+ID4gc3Rv
cHBpbmcgYXQgdGhlIGZpcnN0IGlzc3VlLCBpdCBub3cgbG9ncyBhIHdhcm5pbmcgd2l0aCBkZXRh
aWxzIG9mCj4gPiB0aGUgYWZmZWN0ZWQgd2luZG93IGFuZCBwcm9jZWVkcyB0byBwcm9ncmFtIHRo
ZSByZW1haW5pbmcgaUFUVQo+ID4gZW50cmllcy4KPiA+Cj4gPiBUaGlzIGVuYWJsZXMgcGFydGlh
bCBjb25maWd1cmF0aW9uIHRvIGNvbXBsZXRlIGluIGNhc2VzIHdoZXJlIHNvbWUKPiA+IGlBVFUg
d2luZG93cyBtYXkgbm90IG1lZXQgcmVxdWlyZW1lbnRzLCBpbXByb3Zpbmcgb3ZlcmFsbAo+ID4g
Y29tcGF0aWJpbGl0eS4KPiAKPiBJdCdzIG5vdCByZWFsbHkgY2xlYXIgd2h5IHRoaXMgaXMgbmVl
ZGVkLiAgSSBhc3N1bWUgaXQncyByZWxhdGVkIHRvCj4gZHJvcHBpbmcgcWlsYWlfcGNpZV9vdXRi
b3VuZF9hdHVfYWRkcl92YWxpZCgpLgo+IAoKWWVzLCBJIHdhbnQgdG8gZHJvcCB0aGUgcHJldmlv
dXMgYXR1X2FkZHJfdmFsaWQgZnVuY3Rpb24uCgo+IEkgZ3Vlc3MgZHdfcGNpZV9wcm9nX291dGJv
dW5kX2F0dSgpIG11c3QgcmV0dXJuIGFuIGVycm9yIGZvciBvbmUgb2YKPiB0aGUgUWlMYWkgcmFu
Z2VzPyAgV2hpY2ggb25lLCBhbmQgd2hhdCBleGFjdGx5IGlzIHRoZSBwcm9ibGVtPyAgSQo+IHN0
aWxsIHN1c3BlY3Qgc29tZXRoaW5nIHdyb25nIGluIHRoZSBkZXZpY2V0cmVlIGRlc2NyaXB0aW9u
Lgo+IAoKVGhlIG1haW4gaXNzdWUgaXMgbm90IHRoZSByZXR1cm5lZCBlcnJvcjsganVzdCBuZWVk
IHRvIGF2b2lkIHRlcm1pbmF0aW5nCnRoZSBwcm9jZXNzIHdoZW4gdGhlIGNvbmZpZ3VyYXRpb24g
ZXhjZWVkcyB0aGUgaGFyZHdhcmXigJlzIGV4cGVjdGVkIGxpbWl0cy4KClRoZXJlIGFyZSB0d28g
bWV0aG9kcyB0byBmaXggdGhlIGlzc3VlIG9uIHRoZSBRaWxhaSBTb0M6CgoxLiBTaW1wbHkgc2tp
cCB0aGUgZW50cmllcyB0aGF0IGRvIG5vdCBtYXRjaCB0aGUgZGVzaWdud2FyZSBoYXJkd2FyZSBp
QVRVIGxpbWl0YXRpb25zLgpBbiBlcnJvciB3aWxsIGJlIHJldHVybmVkLCBidXQgaXQgY2FuIGJl
IGlnbm9yZWQuIE9uIHRoZSBRaWxhaSBTb0MsIHRoZSBpQVRVCmxpbWl0YXRpb24gaXMgdGhlIDRH
QiBib3VuZGFyeS4gUWlsYWkgU29DIG9ubHkgbmVlZCB0byBjb25maWd1cmUgaUFUVSBzdXBwb3J0
CnRvIHRyYW5zbGF0ZSBhZGRyZXNzZXMgYmVsb3cgdGhlICIzMi1iaXRzIiBhZGRyZXNzIHJhbmdl
LiBBbHRob3VnaCA2NC1iaXRzCmFkZHJlc3NlcyBkbyBub3QgbWF0Y2ggdGhlIGRlc2lnbndhcmUg
aGFyZHdhcmUgaUFUVSBsaW1pdGF0aW9ucywgdGhlcmUgaXMgbm8KbmVlZCB0byBjb25maWd1cmUg
NjQtYml0cyBhZGRyZXNzZXMsIHNpbmNlIHRoZSBjb25uZWN0aW9uIGlzIGhhcmQtd2lyZWQuCgoy
LiBTZXQgdGhlIGRldmljZXRyZWUgb25seSAyIHZpZXdwb3J0IGZvciBpQVRVIGFuZCBmb3JjZSB1
c2luZyBkZXZpY2V0cmVlIHZhbHVlLgpUaGlzIGlzIGEgd29ya2Fyb3VuZCBpbiB0aGUgZGV2aWNl
dHJlZSwgYnV0IHRoZSBmaXggbG9naWMgaXMgbm90IGVhc3kgdG8gZG9jdW1lbnQuCkluc3RlYWQs
IHdlIHNob3VsZCBlbmZvcmNlIHRoZSB1c2Ugb2YgdGhlIHZpZXdwb3J0IGRlZmluZWQgaW4gdGhl
IGRldmljZXRyZWUgYW5kCm1vZGlmeSB0aGUgZGVzaWdud2FyZSBnZW5lcmljIGNvZGUgYWNjb3Jk
aW5nbHkg4oCUIHVzaW5nIHRoZSB2aWV3cG9ydCB2YWx1ZXMKZnJvbSB0aGUgZGV2aWNldHJlZSBp
bnN0ZWFkIG9mIHJlYWRpbmcgdGhlbSBmcm9tIHRoZSBkZXNpZ253YXJlIHJlZ2lzdGVycy4KU2lu
Y2Ugb25seSB0d28gdmlld3BvcnRzIGFyZSBhdmFpbGFibGUgZm9yIGlBVFUsIHdlIHNob3VsZCBy
ZXNlcnZlIG9uZSBmb3IKdGhlIGNvbmZpZ3VyYXRpb24gcmVnaXN0ZXJzIGFuZCB0aGUgb3RoZXIg
Zm9yIDMyLWJpdCBhZGRyZXNzIGFjY2Vzcy4KVGhlcmVmb3JlLCByZXZlcnNlIGxvZ2ljIHN0aWxs
IG5lZWRzIHRvIGJlIGFkZGVkIHRvIHRoZSBkZXNpZ253YXJlIGdlbmVyaWMgY29kZS4KCk1ldGhv
ZCAyIGFkZHMgZXhjZXNzaXZlIGNvbXBsZXhpdHkgdG8gdGhlIGRlc2lnbndhcmUgZ2VuZXJpYyBj
b2RlLiBJbnN0ZWFkLApkaXJlY3RseSBjb25maWd1cmluZyB0aGUgaUFUVSBhbmQgcmVwb3J0aW5n
IGFuIGVycm9yIHdoZW4gdGhlIGNvbmZpZ3VyYXRpb24KZXhjZWVkcyB0aGUgaGFyZHdhcmUgaUFU
VSBsaW1pdGF0aW9ucyBpcyBhIHNpbXBsZXIgYW5kIG1vcmUgZWZmZWN0aXZlCmFwcHJvYWNoIHRv
IGFwcGx5aW5nIHRoZSBmaXguCgpDb25jbHVzaW9uOgoxLiBUaGUgaUFUVSBuZWVkcyB0byBiZSBj
b25maWd1cmVkIGZvciAzMi1iaXRzIGFkZHJlc3Mgc3BhY2UuCiAgIEluIGNvbXBsaWFuY2Ugd2l0
aCBoYXJkd2FyZSBsaW1pdGF0aW9ucy4KMi4gVGhlIGlBVFUgbmVlZHMgdG8gYmUgY29uZmlndXJl
ZCBmb3IgY29uZmlnIHNwYWNlLgogICBJbiBjb21wbGlhbmNlIHdpdGggaGFyZHdhcmUgbGltaXRh
dGlvbnMuCjMuIFRoZSBpQVRVIG5lZWRzIHRvIGJlIGNvbmZpZ3VyZWQgZm9yIDY0LWJpdCBhZGRy
ZXNzIHNwYWNlLgogICBUaGlzIGRvZXMgbm90IGNvbXBseSB3aXRoIGhhcmR3YXJlIGxpbWl0YXRp
b25zIGFuZCB3aWxsIHByaW50IGFuIGVycm9yLgogICBBcyBsb25nIGFzIGl0IGRvZXMgbm90IHJl
dHVybiBhbiBlcnJvciB2YWx1ZSB0aGF0IHRlcm1pbmF0ZXMgc3Vic2VxdWVudAogICBvcGVyYXRp
b25zLCBpdCBpcyBhY2NlcHRhYmxlLgogICBTaW1wbHkgc2tpcHBpbmcgdGhpcyBlbnRyeSB3aGVu
IGNvbmZpZ3VyaW5nIHRoZSBpQVRVIGlzIGFjY2VwdGFibGUuCgo+ID4gU2lnbmVkLW9mZi1ieTog
UmFuZG9scGggTGluIDxyYW5kb2xwaEBhbmRlc3RlY2guY29tPgo+ID4gLS0tCj4gPiAgZHJpdmVy
cy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1kZXNpZ253YXJlLWhvc3QuYyB8IDkgKysrKystLS0t
Cj4gPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiA+
Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1kZXNpZ253
YXJlLWhvc3QuYyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtZGVzaWdud2FyZS1o
b3N0LmMKPiA+IGluZGV4IDk1MmY4NTk0YjUwMS4uOTFlZTZiOTAzOTM0IDEwMDY0NAo+ID4gLS0t
IGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1kZXNpZ253YXJlLWhvc3QuYwo+ID4g
KysrIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1kZXNpZ253YXJlLWhvc3QuYwo+
ID4gQEAgLTc1Niw3ICs3NTYsNyBAQCBzdGF0aWMgaW50IGR3X3BjaWVfaWF0dV9zZXR1cChzdHJ1
Y3QgZHdfcGNpZV9ycCAqcHApCj4gPiAgICAgICAgICAgICAgIGlmIChyZXNvdXJjZV90eXBlKGVu
dHJ5LT5yZXMpICE9IElPUkVTT1VSQ0VfTUVNKQo+ID4gICAgICAgICAgICAgICAgICAgICAgIGNv
bnRpbnVlOwo+ID4KPiA+IC0gICAgICAgICAgICAgaWYgKHBjaS0+bnVtX29iX3dpbmRvd3MgPD0g
KytpKQo+ID4gKyAgICAgICAgICAgICBpZiAocGNpLT5udW1fb2Jfd2luZG93cyA8PSBpKQo+ID4g
ICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+ID4KPiA+ICAgICAgICAgICAgICAgYXR1Lmlu
ZGV4ID0gaTsKPiA+IEBAIC03NzMsOSArNzczLDEwIEBAIHN0YXRpYyBpbnQgZHdfcGNpZV9pYXR1
X3NldHVwKHN0cnVjdCBkd19wY2llX3JwICpwcCkKPiA+Cj4gPiAgICAgICAgICAgICAgIHJldCA9
IGR3X3BjaWVfcHJvZ19vdXRib3VuZF9hdHUocGNpLCAmYXR1KTsKPiA+ICAgICAgICAgICAgICAg
aWYgKHJldCkgewo+ID4gLSAgICAgICAgICAgICAgICAgICAgIGRldl9lcnIocGNpLT5kZXYsICJG
YWlsZWQgdG8gc2V0IE1FTSByYW5nZSAlcHJcbiIsCj4gPiAtICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBlbnRyeS0+cmVzKTsKPiA+IC0gICAgICAgICAgICAgICAgICAgICByZXR1cm4gcmV0
Owo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGRldl93YXJuKHBjaS0+ZGV2LCAiRmFpbGVkIHRv
IHNldCBNRU0gcmFuZ2UgJXByXG4iLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGVudHJ5LT5yZXMpOwo+ID4gKyAgICAgICAgICAgICB9IGVsc2Ugewo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgIGkrKzsKPiA+ICAgICAgICAgICAgICAgfQo+ID4gICAgICAgfQo+ID4KPiA+IC0t
Cj4gPiAyLjM0LjEKPiA+Cj4gPgo+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPiA+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+ID4gbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+ID4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgoKU2luY2VyZWx5LApSYW5kb2xwaAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
