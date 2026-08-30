Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F46C61DD9
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Aug 2026 14:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FP3Rvo6drL+d5kjs6Q2D7fwpuva2cX8xMIjgIx+8M1I=; b=In89BNZvH/3zNj
	t7Jy38dka4NdssZjX/dAlOfVIjNeE8Supk4IhCvBp1yXnnRRNap9rClSwF2MpBjT7j6KFKNAM2blk
	OTyulfSr1xH4R9lSs6khZN+v9dUpyYTvsOMBNbVhrKvwHmV240H30d07zu7djGqPygWKGrBmvPYAQ
	RHPrcBKh27B3HPD+DXoxMGb1/gZDdntDbEFigaZoI6PUtmSpjjDsOoL2KpNuFCFJk84ffGYg5AawR
	umnLHvXGwIdfy6nUe4m5BAN1cRtswbBnlqv8XTfFRSo5UDyFkB4Ylrcvb7ZDxXN3xqWobljCaXmWK
	v+Ui4LccN8gHSjlzyByQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0gaA-00000007oDK-3EMD;
	Sun, 30 Aug 2026 14:32:26 +0000
Received: from out-1.mta0.migadu.com ([2001:41d0:1004:224b::1] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0ga8-00000007oCw-17iH
	for linux-riscv@lists.infradead.org;
	Sun, 30 Aug 2026 14:32:26 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=lgf0MuQPFoZlIab78/zqlZds7+shjXNJmT7lgzsTekU=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788100341; v=1; x=1788705141;
 b=toh5ZXcqCvC8nLke1DMDLgtRkg1xWupLZ+s1M3gVCBEJYqDuoC2VwOqJ0goqYr89Bxe+Eq1g
 N3N1ily50P2IQotfboQuDpxhJUrv18/gwLa6lem2cXL3dznOV0eykf7cwllWlWpL0w/iRH6JWXO
 LjYCQfIUd9zowtdk/JFgY4kjsCjHmVWUO5m8VVFkrQ3DdqdJR29PJGLbS2WNt1U/Lfe9F+m/pJt
 cUCUlB6KHzvCPmEFSGaSvujhbvHeEsoqZojbj6UmNMWhjqKDK75dYp/Vy+VwmXYiamFciP2L0hs
 stgwEkJC2/PseHMvaXY6Za8X1CuXeAP9bk6GIqjaxnUWQ==
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 7c357459d6dfa994;
	Sun, 30 Aug 2026 14:32:21 +0000
X-Mizu-Trace-ID: 7c357459d6dfa994
X-Migadu-Flow: FLOW_OUT
Date: Sun, 30 Aug 2026 22:32:13 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Yao Zi <me@ziyao.cc>
Cc: Yukai Wu <xiaoyewuz.ruster@gmail.com>, Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>, Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Dongliang Mu <dzm91@hust.edu.cn>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Alexandre Ghiti <alex@ghiti.fr>, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs/zh_CN: Update arch/riscv/vm-layout.rst translation
Message-ID: <apQ-7U-omIeXvZ1N@wyuan.org>
References: <20260829041542.256360-1-xiaoyewuz.Ruster@gmail.com>
 <apMPjRICH06wAxPp@pie>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <apMPjRICH06wAxPp@pie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_073224_736885_5D042C92 
X-CRM114-Status: GOOD (  18.56  )
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

T24gU2F0LCBBdWcgMjksIDIwMjYgYXQgMDQ6NTc6NDlQTSArMDAwMCwgWWFvIFppIHdyb3RlOgo+
IE9uIFNhdCwgQXVnIDI5LCAyMDI2IGF0IDEyOjE1OjEwUE0gKzA4MDAsIFl1a2FpIFd1IHdyb3Rl
Ogo+ID4gVXBkYXRlIERvY3VtZW50YXRpb24vYXJjaC9yaXNjdi92bS1sYXlvdXQucnN0IHRyYW5z
bGF0aW9uLgo+ID4gCj4gPiBVcGRhdGUgdGhlIHRyYW5zbGF0aW9uIHRocm91Z2ggY29tbWl0IDk1
NDI2MGZmNWE0Ngo+ID4gKCJSZXZlcnQgIlJJU0MtVjogbW06IERvY3VtZW50IG1tYXAgY2hhbmdl
cyIiKQo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBZdWthaSBXdSA8eGlhb3lld3V6LlJ1c3RlckBn
bWFpbC5jb20+Cj4gPiAtLS0KPiA+ICAuLi4vemhfQ04vYXJjaC9yaXNjdi92bS1sYXlvdXQucnN0
ICAgICAgICAgICAgIHwgMTggKysrKysrKysrLS0tLS0tLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQs
IDkgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2FyY2gvcmlzY3Yvdm0tbGF5b3V0LnJzdCBi
L0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2FyY2gvcmlzY3Yvdm0tbGF5b3V0LnJz
dAo+ID4gaW5kZXggNGI5ZjRkY2Y2YzE5Li4wZDBlYzhlYTVkMDUgMTAwNjQ0Cj4gPiAtLS0gYS9E
b2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9hcmNoL3Jpc2N2L3ZtLWxheW91dC5yc3QK
PiA+ICsrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2FyY2gvcmlzY3Yvdm0t
bGF5b3V0LnJzdAo+ID4gQEAgLTE1LDcgKzE1LDcgQEAgUklTQy1WIExpbnV45LiK55qE6Jma5ouf
5YaF5a2Y5biD5bGACj4gPiAgOuS9nOiAhTogQWxleGFuZHJlIEdoaXRpIDxhbGV4QGdoaXRpLmZy
Pgo+ID4gIDrml6XmnJ86IDEyIEZlYnJ1YXJ5IDIwMjEKPiA+ICAKPiA+IC3ov5nku73mlofku7bm
j4/ov7DkuoZSSVNDLVYgTGludXjlhoXmoLjkvb/nlKjnmoTomZrmi5/lhoXlrZjluIPlsYDjgIIK
PiA+ICvov5nku73mlofku7bmj4/ov7DkuoYgUklTQy1WIExpbnV4IOWGheaguOS9v+eUqOeahOiZ
muaLn+WGheWtmOW4g+WxgOOAggo+ID4gIAo+ID4gIDMy5L2NIFJJU0MtViBMaW51eCDlhoXmoLgK
PiA+ICA9PT09PT09PT09PT09PT09PT09PT09Cj4gPiBAQCAtMjgsOSArMjgsOSBAQCBUT0RPCj4g
PiAgNjTkvY0gUklTQy1WIExpbnV4IOWGheaguAo+ID4gID09PT09PT09PT09PT09PT09PT09PT0K
PiA+ICAKPiA+IC1SSVNDLVbnibnmnYPmnrbmnoTmlofmoaPmjIflh7rvvIw2NOS9jeWcsOWdgCAi
5b+F6aG75L2/56ysNjMtNDjkvY3lgLzpg73nrYnkuo7nrKw0N+S9je+8jOWQpuWImeWwhuWPkeeU
n+e8uumhteW8guW4uOOAgiLvvJrov5nlsIbomZoKPiA+IC3mi5/lnLDlnYDnqbrpl7TliIbmiJDk
uKTljYrvvIzkuK3pl7TmnInkuIDkuKrpnZ7luLjlpKfnmoTmtJ7vvIzkuIvljYrpg6jliIbmmK/n
lKjmiLfnqbrpl7TmiYDlnKjnmoTlnLDmlrnvvIzkuIrljYrpg6jliIbmmK9SSVNDLVYgTGludXgK
PiA+IC3lhoXmoLjmiYDlnKjnmoTlnLDmlrnjgIIKPiA+ICtSSVNDLVYg54m55p2D5p625p6E5paH
5qGj5oyH5Ye677yMNjQg5L2N5Zyw5Z2A4oCc5b+F6aG75L2/56ysIDYzLTQ4IOS9jeWAvOmDveet
ieS6juesrCA0NyDkvY3vvIzlkKbliJnlsIblj5HnlJ/nvLrpobXlvILluLjjgILigJ3vvJoKPiA+
ICvov5nlsIbomZrmi5/lnLDlnYDnqbrpl7TliIbmiJDkuKTljYrvvIzkuK3pl7TmnInkuIDkuKrp
nZ7luLjlpKfnmoTmtJ7vvIzkuIvljYrpg6jliIbmmK/nlKjmiLfnqbrpl7TmiYDlnKjnmoTlnLDm
lrnvvIzkuIrljYrpg6jliIbmmK8gUklTQy1WCj4gPiArTGludXgg5YaF5qC45omA5Zyo55qE5Zyw
5pa544CCCj4gCj4gSSB0aGluayBjaGFuZ2VzIGFib3ZlIGFyZSBwdXJlbHkgc3R5bGUgaW1wcm92
ZW1lbnRzPyBJZiBzbyBwbGVhc2UKPiBtZW50aW9uIGl0IGluIHRoZSBjb21taXQgbWVzc2FnZSwg
aW5zdGVhZCBvZiBzcGVjaWZ5aW5nIGl0J3MgInVwZGF0aW5nIgo+IG9ubHkuCgpBZ3JlZWQuIFRv
IHB1dCBpdCBmdXJ0aGVyLCBJIHRoaW5rIHRoZSBjb21taXQgbWVzc2FnZSB0ZW1wbGF0ZSB3ZQpw
cm92aWRlZCBpbiBob3ctdG8ucnN0IFsxXSBpcyBzb21ld2hhdCBsaWtlIHRlbGxpbmcgY29udHJp
YnV0b3JzOiBUaGF0J3MKYWxsIHlvdSBuZWVkIHRvIGRvLgoKT2YgY291cnNlLCBpbiBzb21lIGNh
c2VzLCB0aGUgcGF0Y2ggaXMgcXVpdGUgc2ltcGxlIGFuZCB0aGVyZSBpcyBub3RoaW5nCmVsc2Ug
dG8gZWxhYm9yYXRlIG9uLiBIb3dldmVyLCBpbiBzb21lIGNhc2VzLCBzdWNoIGFzIHdoZW4gbWFr
aW5nCmV4dGVuc2l2ZSBjaGFuZ2VzIGFuZCB1cGRhdGVzLCB3ZSBzaG91bGQgZW5jb3VyYWdlIGNv
bnRyaWJ1dG9ycyB0byB3cml0ZQpkb3duIHNvbWUgcmVsZXZhbnQgaW5mb3JtYXRpb24gZm9yIGZ1
dHVyZSByZWZlcmVuY2UuCgpTaW1pbGFybHksIGp1c3QgbGlrZSB0aGlzIHBhdGNoLCB0aGUgYXV0
aG9yIGRpZCBtb3JlIHRoYW4ganVzdCB1cGRhdGU7CmhlIGFsc28gY2FycmllZCBvdXQgb3RoZXIg
YWN0aW9ucywgYnV0IGZhaWxlZCB0byBpbmNsdWRlIHRoZSByZWxldmFudApkZXRhaWxzIGluIHRo
ZSBjb21taXQgbWVzc2FnZS4gU28gSSBmZWVsIHRoYXQgcGVyaGFwcyBvdXIgdGVtcGxhdGUgbWln
aHQKaGF2ZSBzb21ld2hhdCByZXN0cmljdGVkIG91ciB3cml0aW5nPyAodG8gc29tZSBleHRlbnQp
CgpTdXJlLCB0aGUgcmVxdWlyZW1lbnRzIGZvciBjb21taXQgbWVzc2FnZXMgaW4gdGhlIENoaW5l
c2UgZG9jdW1lbnRhdGlvbgphcmUgY2VydGFpbmx5IG5vdCBhcyBzdHJpY3QgYXMgdGhvc2UgZm9y
IHRoZSBtb3JlIGNvcmUgc3Vic3lzdGVtcy4KSG93ZXZlciwgSSBkbyB0aGluayBpdCdzIGZpbmUg
dG8gYXBwcm9wcmlhdGVseSBleHBsaWNpdGx5IGVuY291cmFnZQpjb250cmlidXRvcnMgdG8gaW5j
bHVkZSBtb3JlIG1lYW5pbmdmdWwgcmVsZXZhbnQgaW5mb3JtYXRpb24gaW4gdGhlCmNvbW1pdCBt
ZXNzYWdlcy4KCkFueSBpZGVhcyBmb3IgdGhpcywgb3IgYW55IG9iamVjdGlvbnM/IDspCgpUaGFu
a3MhCgpbMV0gaHR0cHM6Ly9kb2NzLmtlcm5lbC5vcmcvdHJhbnNsYXRpb25zL3poX0NOL2hvdy10
by5odG1sI2lkMTMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
