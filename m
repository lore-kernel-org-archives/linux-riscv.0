Return-Path: <SRS0=8Mga=OI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 623FEC433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Sep 2021 14:24:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF5CA61244
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Sep 2021 14:24:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EF5CA61244
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kN81jAxzAmbm8kvS7ueCJL74uxtiHL5saoP6NC3wcSU=; b=3HOpxGp0pEyy3u
	kwB7jwttmFXUexfcB25hikOjRI7uQgiA+XPLnLmLHI+kARJb2bQHsXYKmjVkHQTb6lo36dzQvSGlF
	eSl5GdlpiFksgXECoUoLeWV8RopE/YCesVP5FfHJ57SAa2IYC8kx+XypD7iGaLqT6Ifz4UCL79odu
	Q+zt/H5Du3He50oh3OUR1sw7mS54BCBc4wPGHgWkF5yVVVEnwwbojwMfd/Slp37qTstoOHe7PDkmQ
	7l7kxRGW1rOjRySF7jSd5Mu3qaCohwIOvIQi03sBHWxCJJ8KM4ivJfi2Hk/bzZQnYHKJ/qcMk1vR1
	3HX9fXeai2WU5HCT33ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mRbGL-00FzCr-Vu; Sat, 18 Sep 2021 14:24:18 +0000
Received: from email6.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mRbG4-00FzAs-OH
 for linux-riscv@lists.infradead.org; Sat, 18 Sep 2021 14:24:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
 Content-Transfer-Encoding; bh=crGu5Ix8RGnS81l9weqFdrV+bdJ/ykn6g7
 LznH09ImM=; b=KlLIDMji0jKgdLYqe1kKdPBEJKEmQ/+DjJVdNxdruF4XPZ/wNb
 q/rE3CGOYWsPdOk7vtiutxvl7M7QGWs72Be36DqDLpV7gloHvOzpD+Jjt1+5kQM8
 7IQ1B67PdqZ76vI1Rgp7+BRr4PIFB2RURFbCMkwNyCuTvpzFXf+cfqNZE=
Received: from xhacker (unknown [101.86.20.138])
 by newmailweb.ustc.edu.cn (Coremail) with SMTP id
 LkAmygBnb7tw9kVhXP4YAA--.2092S2; 
 Sat, 18 Sep 2021 22:23:45 +0800 (CST)
Date: Sat, 18 Sep 2021 22:17:13 +0800
From: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: Chen Huang <chenhuang5@huawei.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Darius Rad <darius@bluespec.com>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/2] riscv: improve unaligned memory accesses
Message-ID: <20210918221713.289f63bb@xhacker>
In-Reply-To: <9200c4c2-44b9-480e-6970-5188640fb00a@huawei.com>
References: <20210916130855.4054926-1-chenhuang5@huawei.com>
 <20210917221429.4d3a15ca@xhacker>
 <9200c4c2-44b9-480e-6970-5188640fb00a@huawei.com>
MIME-Version: 1.0
X-CM-TRANSID: LkAmygBnb7tw9kVhXP4YAA--.2092S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAF1kJF4kCryUXF1rur13twb_yoW5GFW5pa
 1UCFnI9FZ8tr1xGFZ2qwn5uF1Yv3yfWFy7Jr43t34UuF1qvFy7Zr42gFWDGasxJrn7C34j
 gr4SvFnrua45Za7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUyFb7Iv0xC_Cr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
 8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
 64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
 Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l42xK82IYc2Ij64vIr41l4I8I3I0E
 4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGV
 WUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_
 Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rV
 WrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_
 GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8rcTPUUUUU==
X-CM-SenderInfo: xmv2xttqjtqzxdloh3xvwfhvlgxou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210918_072401_265966_EED12B8C 
X-CRM114-Status: GOOD (  22.68  )
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

T24gU2F0LCAxOCBTZXAgMjAyMSAwOToxNDowNSArMDgwMApLZWZlbmcgV2FuZyA8d2FuZ2tlZmVu
Zy53YW5nQGh1YXdlaS5jb20+IHdyb3RlOgoKPiBPbiAyMDIxLzkvMTcgMjI6MTQsIEppc2hlbmcg
Wmhhbmcgd3JvdGU6Cj4gPiBPbiBUaHUsIDE2IFNlcCAyMDIxIDEzOjA4OjUzICswMDAwCj4gPiBD
aGVuIEh1YW5nIDxjaGVuaHVhbmc1QGh1YXdlaS5jb20+IHdyb3RlOgo+ID4gIAo+ID4+IFRoZSBw
YXRjaHNldCBpbXByb3ZlcyBSSVNDViB1bmFsaWduZWQgbWVtb3J5IGFjY2Vzc2VzLCBzZWxlY3Rz
Cj4gPj4gSEFWRV9FRkZJQ0lFTlRfVU5BTElHTkVEX0FDQ0VTUyBpZiBDUFVfSEFTX05PX1VOQUxJ
R05FRCBub3QKPiA+PiBlbmFibGVkIGFuZCBzdXBwb3J0cyBEQ0FDSEVfV09SRF9BQ0NFU1MgdG8g
aW1wcm92ZSB0aGUgZWZmaWNpZW5jeQo+ID4+IG9mIHVuYWxpZ25lZCBtZW1vcnkgYWNjZXNzZXMu
Cj4gPj4KPiA+PiBJZiBDUFUgZG9uJ3Qgc3VwcG9ydCB1bmFsaWduZWQgbWVtb3J5IGFjY2Vzc2Vz
IGZvciBub3csIHBsZWFzZQo+ID4+IHNlbGVjdCBDT05GSUdfQ1BVX0hBU19OT19VTkFMSUdORUQu
IEZvciBJIGRvbid0IGtub3cgd2hpY2ggQ1BVCj4gPj4gZG9uJ3Qgc3VwcG9ydCB1bmFsaWduZWQg
bWVtb3J5IGFjY2Vzc2VzLCBJIGRvbid0IGNob29zZSB0aGUKPiA+PiBDT05GSUcgZm9yIHRoZW0u
ICAKPiA+IFRoaXMgd2lsbCBicmVhayB1bmlmaWVkIGtlcm5lbCBJbWFnZSBmb3IgcmlzY3YuIE9i
dmlvdXNseSwgd2Ugd2lsbCBoYXZlCj4gPiB0d28gaW1hZ2VzIGZvciBlZmZpY2llbnQgdW5hbGln
bmVkIGFjY2VzcyBwbGF0Zm9ybXMgYW5kIG5vbi1lZmZpY2llbnQKPiA+IHVuYWxpZ25lZCBhY2Nl
c3MgcGxhdGZvcm1zLiBJTUhPLCB3ZSBtYXkgbmVlZCBhbHRlcm5hdGl2ZSBtZWNoYW5pc20gb3IK
PiA+IHNvbWV0aGluZyBlbHNlIHRvIGR5bmFtaWNhbGx5IGVuYWJsZSByZWxhdGVkIGNvZGUgcGF0
aC4gIAo+IAo+IGl0IHdvbid0IGJyZWFrIHVuaWZpZWQga2VybmVsIEltYWdlIGZvciByaXNjdiwg
aWYgb25lIFNvQyBjaG9vc2UKPiAKPiBDUFVfSEFTX05PX1VOQUxJR05FRCwgdGhlIHNpbmdsZSBJ
bWFnZSB3b24ndCBzdXBwb3J0IHVuYWxpZ25lZCBtZW1vcnkKCnRoZSAidW5pZmllZCIgbWVhbnMg
dGhlIGtlcm5lbCBJbWFnZSBoYXMgdG8gc3VwcG9ydCBhbGwgUlY2NEdDIG9yIFJWMzJHQyBTb0Nz
LgpUbyBtYWtlIHRoZSBJbWFnZSB3b3JrcyBmb3IgYm90aCBlZmZpY2llbnQgdW5hbGlnbmVkIGFj
Y2VzcyBhbmQgaW5lZmZpY2llbnQKdW5hbGlnbmVkIGFjY2VzcywgSSB0aGluayB3ZSdkIGJldHRl
ciBtYWtlICJpbmVmZmljaWVudCB1bmFsaWduZWQgYWNjZXNzIgpkZWZhdWx0IGJlaGF2aW9yLCB0
aGUgdXNlIGFsdGVybmF0aXZlIGV0Yy4gdGVjaCB0byBwYXRjaCByZWxhdGVkIGNvZGUgcGF0aApm
b3IgZWZmaWNpZW50IHVuYWxpZ25lZCBhY2Nlc3MuCgoKPiAKPiBhY2Nlc3NlcywgaW5kZWVkLCBp
dCBkZXBlbmRzIG9uIHRoZSBDT05GSUcsIGFuZCBub3csIGFybS9wb3dlcnBjL202OGsgaGFzCgps
aW51eCBEaXN0cmlidXRpb25zIGRvZXNuJ3QgaGF2ZSBlbm91Z2ggYmFja2dyb3VuZCBvZiB3aGlj
aCBjb25maWcgb3B0aW9ucwptdXN0IGJlIGVuYWJsZWQuCgo+IAo+IHNpbWlsYXIgY29uZmlndXJh
dGlvbi4KCkkgaGF2ZSBsaXR0bGUga25vd2xlZGdlIG9mIHBvd2VycGMgb3IgbTY4aywgYnV0IHRo
ZXJlIGFyZSBzZXJ2ZXJhbCBkaWZmZXJlbnQKZGVmY29uZmlnIGZpbGVzIGZvciBhcm0sIGZvciBl
eGFtcGxlIG11bHRpX3Y3X2RlZmNvbmZpZyBhbmQgbXVsdGlfdjVfZGVmY29uZmlnLgpUaGUgcHJl
dmlvdXMgdjcgdmVyc2lvbiBlbmFibGVzIEhBVkVfRUZGSUNJRU5UX1VOQUxJR05FRF9BQ0NFU1Mg
d2hpbGUKdGhlIGxhdGVyIHY1IGRvZXNuJ3QuIFdpbGwgeW91IHBlcnN1YWRlIHJpc2N2IG1haW50
YWluZXJzIHRvIGFjY2VwdCBvbmUgbW9yZQpkZWZjb25maWcgZmlsZT8KClRoYW5rcwoKPiAKPiBZ
ZXMswqAgaXQgY291bGQgYmUgYW4gb3B0aW1pemF0aW9uIHZpYSBhbHRlcm5hdGl2ZSBtZWNoYW5p
c20gb3Igc29tZXRoaW5nIAo+IGVsc2UgdG8KPiAKPiBkeW5hbWljYWxseSBlbmFibGUgcmVsYXRl
ZCBjb2RlIHBhdGggbGF0ZXIuCj4gCj4gPgo+ID4gUmVnYXJkcwo+ID4gIAo+ID4+IENoYW5nZXMg
c2luY2UgdjE6Cj4gPj4gICAtIEFzIERhcml1cyBSYWQgYW5kIEppc2hlbmcgWmhhbmcgbWVudGlv
bmVkLCBzb21lIENQVXMgZG9uJ3Qgc3VwcG9ydAo+ID4+ICAgICB1bmFsaWduZWQgbWVtb3J5IGFj
Y2Vzc2VzLCBhZGQgYW4gb3B0aW9uIGZvciBDUFVzIHRvIGNob29zZSBpdCBvciBub3QuCj4gPj4K
PiA+PiBDaGVuIEh1YW5nICgyKToKPiA+PiAgICByaXNjdjogc3VwcG9ydCBIQVZFX0VGRklDSUVO
VF9VTkFMSUdORURfQUNDRVNTCj4gPj4gICAgcmlzY3Y6IFN1cHBvcnQgRENBQ0hFX1dPUkRfQUND
RVNTCj4gPj4KPiA+PiAgIGFyY2gvcmlzY3YvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICB8
ICA1ICsrKysKPiA+PiAgIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vd29yZC1hdC1hLXRpbWUuaCB8
IDM3ICsrKysrKysrKysrKysrKysrKysrKysrKysKPiA+PiAgIDIgZmlsZXMgY2hhbmdlZCwgNDIg
aW5zZXJ0aW9ucygrKQo+ID4+ICAKPiA+Cj4gPiAuCj4gPiAgCgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
