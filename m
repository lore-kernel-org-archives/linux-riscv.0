Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D41DECAAD1
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Sep 2022 08:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dKPK21G+b5/F6XkRWMl+2Ign1fqEN3v8gMmXXaP90pY=; b=0FgpICrVDeRwuz
	+3foeDuQzbhO4rUpEJizgi9LcWZpSVJBMoxbykWvcJnzDr5+0TvAzE76YlgKhf8nJStdnbPpwGgU9
	7vPaidnob7818jStQS9iBRg7WmnG2O7cdVxZJrZElZXydzCjhvEBUwH8AQNqyFp3loUo7ZLsGGaXc
	hHud/F8UYuJ1xJR4rxVyeGhWTCLqqVSB0NkgUtTGWoEk1FvSXz37XbUd5R6IveBLYCjN3KNxIVvIG
	iOlrU50ssYwAjAq0ZYZHS2VxTY5JiG8ZTD2Al+Zqb1S89iR0tcfnLSNPPlrzqUs5zT9IuCT5Ra9ic
	Bpw1DhSbONKvk3avgeww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTfey-00AcCQ-7d; Thu, 01 Sep 2022 08:34:48 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTfev-00AcC2-PB
	for linux-riscv@lists.infradead.org; Thu, 01 Sep 2022 08:34:47 +0000
Received: by mail-lf1-x12b.google.com with SMTP id j14so13017760lfu.4
        for <linux-riscv@lists.infradead.org>; Thu, 01 Sep 2022 01:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=zdKf2GU/029X1i1nZhbauxVm45u7tJ/0ih6Hx+pKrBM=;
        b=iOTyDaA5qBzZnGKmfEPl6ByrywxzC3nZx51SmMXhUfMrmY6jTAN2IP9XaqlTqPAZY5
         sGOGDQybEEmjb8cSKMeNvpmp0rPrNdrr+q3NCw0KcSw1CYx6GwEZGl7+w5xQGiX6/UEY
         Oc+zXTM1XlKZrHiBpe2ZnbvZc5w2EjffeyHUBd+54dUPwHLO6gEp9SzakxCaDSKv0m96
         ps0UWCnyKV2P5W8vonTulb0AN5SgHNIL59C/8kwGc7sURgINVqA0sRWHylxw/PRH9/s4
         kaUaGihYtSdwyvtFmbEqgwQujsp9Uibh3fCPD5V1DZi7TVnqc4nbE0eXc35AwOURCF+F
         wPKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=zdKf2GU/029X1i1nZhbauxVm45u7tJ/0ih6Hx+pKrBM=;
        b=lPhKZXIuqumZscW4dQHgXnLI0XPAmhDd6AJNFMzbxk8cNOGmH7lB7lmuFlIJyaeRyr
         NrSOVN0GfCasBdtdJxLc65ezARYrgrHHHvvajaCi9cNBYgr6MdoOiVtnMGXNlNtCzSfq
         3aLXLnyw0MlbQsD6AEA9TgUG4UCniWitpmCyNda23LDZetKXwIBJbmbiftxIEhXtD91I
         48PjMMSS+KxG5d+0r1JA072T9TPvbtwJTxHSi8IDlt78gcJ4Ci6ynoYQ3JPkEM+vl3Q6
         B8pz/K152/TRJdVyFIsV75tMsn32r0vCu0o8B46RFptwaKLg8vMxFNSeLlg54aDOPDyP
         X7Gg==
X-Gm-Message-State: ACgBeo1n6rvFHtUw1wqsvH+H4jyrgWt7Xy5+Ev/g4tyIxc7ajOP0wf7C
	VeG0zn9tgpe3cnEJ6mMAwzJ+Dq3EV/O9rWudsK85bQ==
X-Google-Smtp-Source: AA6agR5jhatVHrFF5q4/HGpIxNLUhMCeUtZerrvXfmtwEERfpvOC2i4/nXoAxEFMPqvotHuMz5YVI5UiC5lkKkfAt7U=
X-Received: by 2002:a05:6512:c0c:b0:48d:1e9d:aa14 with SMTP id
 z12-20020a0565120c0c00b0048d1e9daa14mr11136553lfu.322.1662021281851; Thu, 01
 Sep 2022 01:34:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220829062202.3287-1-zong.li@sifive.com> <20220830082620.1680602-1-ben.dooks@sifive.com>
 <fdec1b72-27f3-96e6-5e19-d54ded4aea68@microchip.com> <cefcf96f-5bcc-d134-fbe5-d1169313b6f3@codethink.co.uk>
 <CA+ZOyajWRUFppg26O1XHfRuJHWB3jk-=-i=FBV9XYgHgshuwQA@mail.gmail.com> <e9132264-bec6-0f39-ff42-d8b6e95b2492@sifive.com>
In-Reply-To: <e9132264-bec6-0f39-ff42-d8b6e95b2492@sifive.com>
From: Zong Li <zong.li@sifive.com>
Date: Thu, 1 Sep 2022 16:34:30 +0800
Message-ID: <CANXhq0qzqUHkWWAT3puANMt2HCDE38QFYYyAcpZuiQW_Umgueg@mail.gmail.com>
Subject: Re: [PATCH] soc: sifive: ccache: reduce printing on init
To: Ben Dooks <ben.dooks@sifive.com>
Cc: Zong Li <zongbox@gmail.com>, Ben Dooks <ben.dooks@codethink.co.uk>, 
	Conor Dooley <Conor.Dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Greentime Hu <greentime.hu@sifive.com>, 
	"linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_013445_870076_0519CFFC 
X-CRM114-Status: GOOD (  25.79  )
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

T24gV2VkLCBBdWcgMzEsIDIwMjIgYXQgMTE6NTUgUE0gQmVuIERvb2tzIDxiZW4uZG9va3NAc2lm
aXZlLmNvbT4gd3JvdGU6Cj4KPiBPbiAzMS8wOC8yMDIyIDA2OjIyLCBab25nIExpIHdyb3RlOgo+
ID4gQmVuIERvb2tzIDxiZW4uZG9va3NAY29kZXRoaW5rLmNvLnVrPiDmlrwgMjAyMuW5tDjmnIgz
MeaXpSDpgLHkuIkg5YeM5pmoMTowNOWvq+mBk++8mgo+ID4+Cj4gPj4gT24gMzAvMDgvMjAyMiAx
NzozMCwgQ29ub3IuRG9vbGV5QG1pY3JvY2hpcC5jb20gd3JvdGU6Cj4gPj4+IE9uIDMwLzA4LzIw
MjIgMDk6MjYsIEJlbiBEb29rcyB3cm90ZToKPiA+Pj4+IEVYVEVSTkFMIEVNQUlMOiBEbyBub3Qg
Y2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtub3cgdGhlIGNvbnRl
bnQgaXMgc2FmZQo+ID4+Pj4KPiA+Pj4+IFRoZSBkcml2ZXIgcHJpbnRzIG91dCA2IGxpbmVzIG9u
IHN0YXJ0dXAsIHdoaWNoIGNhbiBlYXNpbHkgYmUgcmVkY3VlZAo+ID4+Pj4gdG8gdHdvIGxpbmVz
IHdpdGhvdXQgbG9zaW5nIGFueSBpbmZvcm1hdGlvbi4KPiA+Pj4+Cj4gPj4+PiBOb3RlLCB0byBt
YWtlIHRoZSB0eXBlcyB3b3JrIGJldHRlciwgdWludDY0X3QgaGFzIGJlZW4gcmVwbGFjZWQgd2l0
aAo+ID4+Pj4gVUxMIHRvIG1ha2UgdGhlIHVuc2lnbmVkIGxvbmcgbG9uZyBtYXRjaCB0aGUgZm9y
bWF0IGluIHRoZSBwcmludAo+ID4+Pj4gc3RhdGVtZW50Lgo+ID4+Pj4KPiA+Pj4+IFNpZ25lZC1v
ZmYtYnk6IEJlbiBEb29rcyA8YmVuLmRvb2tzQHNpZml2ZS5jb20+Cj4gPj4+PiAtLS0KPiA+Pj4+
ICAgIGRyaXZlcnMvc29jL3NpZml2ZS9zaWZpdmVfY2NhY2hlLmMgfCAyNSArKysrKysrKysrKy0t
LS0tLS0tLS0tLS0tCj4gPj4+PiAgICAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwg
MTQgZGVsZXRpb25zKC0pCj4gPj4+Pgo+ID4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc29jL3Np
Zml2ZS9zaWZpdmVfY2NhY2hlLmMgYi9kcml2ZXJzL3NvYy9zaWZpdmUvc2lmaXZlX2NjYWNoZS5j
Cj4gPj4+PiBpbmRleCA0NmNlMzNkYjdkMzAuLjY1YTEwYTZlZTIxMSAxMDA2NDQKPiA+Pj4+IC0t
LSBhL2RyaXZlcnMvc29jL3NpZml2ZS9zaWZpdmVfY2NhY2hlLmMKPiA+Pj4+ICsrKyBiL2RyaXZl
cnMvc29jL3NpZml2ZS9zaWZpdmVfY2NhY2hlLmMKPiA+Pj4+IEBAIC03NiwyMCArNzYsMTcgQEAg
c3RhdGljIHZvaWQgc2V0dXBfc2lmaXZlX2RlYnVnKHZvaWQpCj4gPj4+Pgo+ID4+Pj4gICAgc3Rh
dGljIHZvaWQgY2NhY2hlX2NvbmZpZ19yZWFkKHZvaWQpCj4gPj4+PiAgICB7Cj4gPj4+PiAtICAg
ICAgIHUzMiByZWd2YWwsIHZhbDsKPiA+Pj4+IC0KPiA+Pj4+IC0gICAgICAgcmVndmFsID0gcmVh
ZGwoY2NhY2hlX2Jhc2UgKyBTSUZJVkVfQ0NBQ0hFX0NPTkZJRyk7Cj4gPj4+PiAtICAgICAgIHZh
bCA9IHJlZ3ZhbCAmIDB4RkY7Cj4gPj4+PiAtICAgICAgIHByX2luZm8oIkNDQUNIRTogTm8uIG9m
IEJhbmtzIGluIHRoZSBjYWNoZTogJWRcbiIsIHZhbCk7Cj4gPj4+PiAtICAgICAgIHZhbCA9IChy
ZWd2YWwgJiAweEZGMDApID4+IDg7Cj4gPj4+PiAtICAgICAgIHByX2luZm8oIkNDQUNIRTogTm8u
IG9mIHdheXMgcGVyIGJhbms6ICVkXG4iLCB2YWwpOwo+ID4+Pj4gLSAgICAgICB2YWwgPSAocmVn
dmFsICYgMHhGRjAwMDApID4+IDE2Owo+ID4+Pj4gLSAgICAgICBwcl9pbmZvKCJDQ0FDSEU6IFNl
dHMgcGVyIGJhbms6ICVsbHVcbiIsICh1aW50NjRfdCkxIDw8IHZhbCk7Cj4gPj4+PiAtICAgICAg
IHZhbCA9IChyZWd2YWwgJiAweEZGMDAwMDAwKSA+PiAyNDsKPiA+Pj4+IC0gICAgICAgcHJfaW5m
bygiQ0NBQ0hFOiBCeXRlcyBwZXIgY2FjaGUgYmxvY2s6ICVsbHVcbiIsICh1aW50NjRfdCkxIDw8
IHZhbCk7Cj4gPj4+PiAtCj4gPj4+PiAtICAgICAgIHJlZ3ZhbCA9IHJlYWRsKGNjYWNoZV9iYXNl
ICsgU0lGSVZFX0NDQUNIRV9XQVlFTkFCTEUpOwo+ID4+Pj4gLSAgICAgICBwcl9pbmZvKCJDQ0FD
SEU6IEluZGV4IG9mIHRoZSBsYXJnZXN0IHdheSBlbmFibGVkOiAlZFxuIiwgcmVndmFsKTsKPiA+
Pj4+ICsgICAgICAgdTMyIGNmZzsKPiA+Pj4+ICsKPiA+Pj4+ICsgICAgICAgY2ZnID0gcmVhZGwo
Y2NhY2hlX2Jhc2UgKyBTSUZJVkVfQ0NBQ0hFX0NPTkZJRyk7Cj4gPj4+PiArCj4gPj4+PiArICAg
ICAgIHByX2luZm8oIkNDQUNIRTogJXUgYmFua3MsICV1IHdheXMsIHNldHMvYmFuaz0lbGx1LCBi
eXRlcy9ibG9jaz0lbGx1XG4iLAo+ID4+Pj4gKyAgICAgICAgICAgICAgIChjZmcgJiAweGZmKSwg
KGNmZyA+PiA4KSAmIDB4ZmYsCj4gPj4+PiArICAgICAgICAgICAgICAgMVVMTCA8PCAoKGNmZyA+
PiAxNikgJiAweGZmKSwKPiA+Pj4KPiA+Pj4gVGhpcyBpcyBqdXN0IEJJVF9VTEwoKGNmZyA+PiAx
NikgJiAweGZmKSwgbm8/Cj4gPj4+IFdvdWxkIGJlIG5pY2UgdG9vIGlmIHRoZXNlIHdlcmUgZGVm
aW5lZCwgc28geW91J2QgaGF2ZSBzb21ldGhpbmcKPiA+Pj4gbGlrZSBCSVRfVUxMKChjZmcgPj4g
U0VUU19QRVJfQkFOS19TSElGVCkgJiAweGZmKQo+ID4+Pgo+ID4+PiBJIGRvIGxpa2UgdGhlIGNs
ZWFudXAgb2YgdGhlIHVpbnQ2NF90ICYgY3V0dGluZyBkb3duIG9uIHRoZSBwcmludHMKPiA+Pj4g
dGhvdWdoIDopIEFnYWluLCBpdCdkIGJlIG5pY2UgaWYgeW91IGFuZCBab25nIGNvdWxkIGNvbGxh
Ym9yYXRlIG9uCj4gPj4+IGEgY29tYmluZWQgdjIuCj4gPj4KPiA+PiBJIHRoaW5rIGV2ZW4gQklU
X1VMKCkgd291bGQgZG8gaGVyZSwgaWYgc29tZW9uZSBpcyBnb2luZyB0byBtYWtlIGEKPiA+PiBj
YWNoZSBiaWdnZXIgdGhhbiAyR2lCIHdlJ2xsIHByb2JhYmx5IGJlIHF1aXRlIG9sZCBieSB0aGVu
LCBzbyB2Mgo+ID4+IG1pZ2h0IGhhdmUgdGhlIGxhc3QgdHdvIHZhbHVlcyBkb3duIGFzICVsdS4K
PiA+Pgo+ID4KPiA+IEhpIEJlbiwKPiA+IFRoYW5rcyBmb3IgeW91ciBzdWdnZXN0aW9uLCBJZiB5
b3UgZG9uJ3QgbWluZCwgSSB3aWxsIHRha2UgdGhpcyBpbnRvCj4gPiBteSBWMiBwYXRjaHNldC4K
Pgo+IFRoYW5rcy4KPgo+IEkgbWF5IHdlbGwgcG9zdCB2MiBvZiB0aGlzIHRvbW9ycm93IHdpdGgg
dGhlIEJJVF9VTEwoKSBzdWdnZXN0aW9ucwo+IGZyb20gQ29ub3IsIG9yIGV2ZW4gZG93biB0byBC
SVRfVUwoKSBhbmQgdXNlICVsdSBhcyBub3RlZC4KPgoKTm8gcHJvYmxlbSBCZW4uIENvdWxkIHlv
dSBwbGVhc2UgYWxzbyBhZGQgbWUgaW4gdGhlIHRocmVhZCBvZiB5b3VyIHYyLAp0aGVuIEkgY2Fu
IHRha2UgaXQgYW5kIHNlbmQgb3V0IG15IHYyIHBhdGNoc2V0LiBUaGFua3MuCgo+ID4KPiA+Pj4g
VGhhbmtzLAo+ID4+PiBDb25vci4KPiA+Pj4KPiA+Pj4+ICsgICAgICAgICAgICAgICAxVUxMIDw8
ICgoY2ZnID4+IDI0KSAmIDB4ZmYpKTsKPiA+Pj4+ICsKPiA+Pj4+ICsgICAgICAgY2ZnID0gcmVh
ZGwoY2NhY2hlX2Jhc2UgKyBTSUZJVkVfQ0NBQ0hFX1dBWUVOQUJMRSk7Cj4gPj4+PiArICAgICAg
IHByX2luZm8oIkNDQUNIRTogSW5kZXggb2YgdGhlIGxhcmdlc3Qgd2F5IGVuYWJsZWQ6ICVkXG4i
LCBjZmcpOwo+ID4+Pj4gICAgfQo+ID4+Pj4KPiA+Pj4+ICAgIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
b2ZfZGV2aWNlX2lkIHNpZml2ZV9jY2FjaGVfaWRzW10gPSB7Cj4gPj4+PiAtLQo+ID4+Pj4gMi4z
NS4xCj4gPj4+Pgo+ID4+Pgo+ID4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+ID4+PiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiA+Pj4gbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+ID4+PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cj4gPj4+Cj4gPj4KPiA+PiAtLQo+ID4+IEJl
biBEb29rcyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBodHRwOi8vd3d3LmNvZGV0aGlu
ay5jby51ay8KPiA+PiBTZW5pb3IgRW5naW5lZXIgICAgICAgICAgICAgICAgICAgICAgICAgQ29k
ZXRoaW5rIC0gUHJvdmlkaW5nIEdlbml1cwo+ID4+Cj4gPj4gaHR0cHM6Ly93d3cuY29kZXRoaW5r
LmNvLnVrL3ByaXZhY3kuaHRtbAo+ID4+Cj4gPj4KPiA+PiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+
ID4+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiA+PiBodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cj4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
