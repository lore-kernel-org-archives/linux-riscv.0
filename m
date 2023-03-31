Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE4C0C76196
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Mar 2023 12:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V/JUmTstYoTCUuYfEAlC1YJ7tpBpKtmabVlEol6oOTg=; b=Mh9RG71Jje9gE/
	K4RMTRY+vlpVVFVaiW8v1b9OndZCCEb+MY8BcqOA5FOR75n5/qWx4MNRMISpsdIWELh/5YgvUMTOJ
	4UnpfBOWi6LAS6uhXhKWa+o6cl6yMiSP7oeEpQI98pbHeezFOW4CvRUq9cQF1VgqZPo1D6UGgM5sm
	+xRu0UhiRdP/eOUqkjBJHnbmPpLUN+GLrb3eq520hyUyYpXPydCX8xOlUpBFZ6zibSgBFNepCyyu/
	ykq6lw8B1qnhQlEDGu7pO4pX5CQ+bFfq5Py9OEexGsk1860zjNg49t8s0fInaQr7iVRPxEZ33RtOf
	9PKtOA+b2SpLF6kwQHQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piEG2-007Qpl-1q;
	Fri, 31 Mar 2023 12:53:30 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piEG0-007Qop-0n
	for linux-riscv@lists.infradead.org;
	Fri, 31 Mar 2023 12:53:29 +0000
Received: by mail-ed1-x52d.google.com with SMTP id er13so48194966edb.9
        for <linux-riscv@lists.infradead.org>; Fri, 31 Mar 2023 05:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112; t=1680267204;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YIZnVNAeusSw2DklqSF0RmxvOxwbV5Dj+erXFtgfBtA=;
        b=WzN8sl+ja+DSJjEqAeZpmG8GXY9GKJuU8urNlcQdUzweq6Uu3o5ks6Ju9S74aGupiR
         HzV2uKx/E9/Pj4I7qg1mHYPxO1pdtSQ87bT/eU0ZQD9BPaZojeN086LXpX+0a4y1IrhJ
         uF/f+zQDB/jDpRYyHR7/2GfCCB9VhQ33mlYwKH1Jd+VAy5ulzlOPrmczkiKTIICqUXya
         xU9TGe94YFKPmlE2btyW2PE0Qv/ymnr+0NKGmFvq7NXYesbNYZrMV5ZWCLj0tmUhX647
         TQROSUPOZ2ocj3iWDrm6DUEB9JGcHWR2/FFLvt/aqFZAFwdNyTP9Zd8tK/PvTnfg78zE
         vLmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680267204;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YIZnVNAeusSw2DklqSF0RmxvOxwbV5Dj+erXFtgfBtA=;
        b=s6e8BI+iAY2ep6qhpla9AI2p4RwTyMYtJsDjaP5Zoaf69vwzZi82wW5wp6xGW9YZ+z
         9onOu93/P5mGrQCBL3/5kwU0mruzKBtWTc7IoHSEqhWD38JfTnQSvGkGQXsGYRXoP7WN
         SPQw7XpvFyVznG7rhjgF837vZupimHocuz1bBoN7d2DZttDSzWRlV8P/wc9on4u7mVxb
         jbPDbiKBXXA8U1zNC3gGitiZnjOa8muaSI+30GOeol5cZNuA3orNVMvC5iM4eOl6PmC6
         KcdKiXzGg5cLVT6h+6tLLJX30ZaLM6xwrDoxVwiCSmOoErRC4P+9W1m9fYVBO0oklX1v
         KXPw==
X-Gm-Message-State: AAQBX9cDgjGy7QxHpfjgygOrSWkjXKwedWbzYmLLoPK7ZU3VkWQDuMsc
	w5XJ5TUkvyMCFWIkpgDy0YN1x7NBlxahEBKarn5xeQ==
X-Google-Smtp-Source: AKy350aXJtieoI5T98QbeE9lxz4pl2omhYkDSZLjnzLzVIg3TVO430qunA++yOjjQfcGF1NH3RBLqUE4qLo4jY8BK6w=
X-Received: by 2002:a17:907:9623:b0:93e:aac:bb8d with SMTP id
 gb35-20020a170907962300b0093e0aacbb8dmr13612957ejc.13.1680267203799; Fri, 31
 Mar 2023 05:53:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230128072737.2995881-3-apatel@ventanamicro.com> <mhng-0f9bdf58-5289-4db4-8fd7-38898824c44f@palmer-ri-x1c9>
In-Reply-To: <mhng-0f9bdf58-5289-4db4-8fd7-38898824c44f@palmer-ri-x1c9>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 31 Mar 2023 18:23:11 +0530
Message-ID: <CAAhSdy3vPQw1OcRx3kQwt8UHgKa+18Ut-SzZkb8gQTHDRK7e2w@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] RISC-V: Detect AIA CSRs from ISA string
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: apatel@ventanamicro.com, pbonzini@redhat.com, atishp@atishpatra.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, ajones@ventanamicro.com, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_055328_473401_617DDC33 
X-CRM114-Status: GOOD (  25.72  )
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

SGkgUGFsbWVyCgpPbiBGcmksIEZlYiAzLCAyMDIzIGF0IDU6NTTigK9BTSBQYWxtZXIgRGFiYmVs
dCA8cGFsbWVyQGRhYmJlbHQuY29tPiB3cm90ZToKPgo+IE9uIEZyaSwgMjcgSmFuIDIwMjMgMjM6
Mjc6MzIgUFNUICgtMDgwMCksIGFwYXRlbEB2ZW50YW5hbWljcm8uY29tIHdyb3RlOgo+ID4gV2Ug
aGF2ZSB0d28gZXh0ZW5zaW9uIG5hbWVzIGZvciBBSUEgSVNBIHN1cHBvcnQ6IFNtYWlhIChNLW1v
ZGUgQUlBIENTUnMpCj4gPiBhbmQgU3NhaWEgKFMtbW9kZSBBSUEgQ1NScykuCj4KPiBUaGlzIGhh
cyBwcmV0dHkgbXVjaCB0aGUgc2FtZSBwcm9ibGVtIHRoYXQgd2UgaGFkIHdpdGggdGhlIG90aGVy
Cj4gQUlBLXJlbGF0ZWQgSVNBIHN0cmluZyBwYXRjaGVzLCB3aGVyZSB0aGVyZSdzIHRoYXQgYW1i
aWd1aXR5IHdpdGggdGhlCj4gbm9uLXJhdGlmaWVkIGNoYXB0ZXJzLiAgSUlSQyB3aGVuIHRoaXMg
Y2FtZSB1cCBpbiBHQ0MgdGhlIHJvdWdoIGlkZWEgd2FzCj4gdG8gdHJ5IGFuZCBkb2N1bWVudCB0
aGF0IHdlJ3JlIGdvaW5nIHRvIGludGVycHJldCB0aGUgc3RhbmRhcmQgSVNBCj4gc3RyaW5ncyB0
aGF0IHdheSwgYnV0IG5vdyB0aGF0IHdlJ3JlIGRvaW5nIGN1c3RvbSBJU0EgZXh0ZW5zaW9ucyBp
dAo+IHNlZW1zIHNhbmVyIHRvIGp1c3QgZGVmaW5lIG9uIGhlcmUgdGhhdCByZW1vdmVzIHRoZSBh
bWJpZ3VpdHkuCj4KPiBJIGp1c3Qgc2VudAo+IDxodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIw
MjMwMjAzMDAxMjAxLjE0NzcwLTEtcGFsbWVyQHJpdm9zaW5jLmNvbS8+Cj4gd2hpY2ggZG9jdW1l
bnRzIHRoYXQuCgpUaGUgSU9NTVUgYW5kIEFJQSBjaGFwdGVyOCBhcmUgZnJvemVuIGFuZCBpbiBw
dWJsaWMgcmV2aWV3LgpSZWZlciwgaHR0cHM6Ly9saXN0cy5yaXNjdi5vcmcvZy90ZWNoLWFpYS9t
ZXNzYWdlLzM0NgoKVGhpcyBtZWFucyB0aGUgZW50aXJlIEFJQSBzcGVjaWZpY2F0aW9uIGlzIG5v
dyBmcm96ZW4gKGkuZS4gbm8KY2hhcHRlcnMgaW4gZHJhZnQgc3RhdGUpLgoKSSB3aWxsIHJlYmFz
ZSB0aGlzIHNlcmllcyBhbmQgc2VuZC1vdXQgdjMuIEl0IHdvdWxkIGJlIGdyZWF0IGlmIHlvdQpj
YW4gQUNLIHRoZSBQQVRDSDIgb2YgdGhpcyBzZXJpZXMuCgpUaGFua3MsCkFudXAKCj4KPiA+IFdl
IGV4dGVuZCB0aGUgSVNBIHN0cmluZyBwYXJzaW5nIHRvIGRldGVjdCBTbWFpYSBhbmQgU3NhaWEg
ZXh0ZW5zaW9ucy4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVu
dGFuYW1pY3JvLmNvbT4KPiA+IFJldmlld2VkLWJ5OiBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50
YW5hbWljcm8uY29tPgo+ID4gLS0tCj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5o
IHwgMiArKwo+ID4gIGFyY2gvcmlzY3Yva2VybmVsL2NwdS5jICAgICAgICB8IDIgKysKPiA+ICBh
cmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgfCAyICsrCj4gPiAgMyBmaWxlcyBjaGFuZ2Vk
LCA2IGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9od2NhcC5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCj4gPiBpbmRleCA4
NjMyOGUzYWNiMDIuLjM0MWVmMzBhMzcxOCAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vaHdjYXAuaAo+ID4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5o
Cj4gPiBAQCAtNTksNiArNTksOCBAQCBlbnVtIHJpc2N2X2lzYV9leHRfaWQgewo+ID4gICAgICAg
UklTQ1ZfSVNBX0VYVF9aSUhJTlRQQVVTRSwKPiA+ICAgICAgIFJJU0NWX0lTQV9FWFRfU1NUQywK
PiA+ICAgICAgIFJJU0NWX0lTQV9FWFRfU1ZJTlZBTCwKPiA+ICsgICAgIFJJU0NWX0lTQV9FWFRf
U01BSUEsCj4gPiArICAgICBSSVNDVl9JU0FfRVhUX1NTQUlBLAo+ID4gICAgICAgUklTQ1ZfSVNB
X0VYVF9JRF9NQVgKPiA+ICB9Owo+ID4gIHN0YXRpY19hc3NlcnQoUklTQ1ZfSVNBX0VYVF9JRF9N
QVggPD0gUklTQ1ZfSVNBX0VYVF9NQVgpOwo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2Vy
bmVsL2NwdS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1LmMKPiA+IGluZGV4IDFiOWE1YTY2ZTU1
YS4uYTIxNWVjOTI5MTYwIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1LmMK
PiA+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2NwdS5jCj4gPiBAQCAtMTYyLDYgKzE2Miw4IEBA
IGFyY2hfaW5pdGNhbGwocmlzY3ZfY3B1aW5mb19pbml0KTsKPiA+ICAgKiAgICBleHRlbnNpb25z
IGJ5IGFuIHVuZGVyc2NvcmUuCj4gPiAgICovCj4gPiAgc3RhdGljIHN0cnVjdCByaXNjdl9pc2Ff
ZXh0X2RhdGEgaXNhX2V4dF9hcnJbXSA9IHsKPiA+ICsgICAgIF9fUklTQ1ZfSVNBX0VYVF9EQVRB
KHNtYWlhLCBSSVNDVl9JU0FfRVhUX1NNQUlBKSwKPiA+ICsgICAgIF9fUklTQ1ZfSVNBX0VYVF9E
QVRBKHNzYWlhLCBSSVNDVl9JU0FfRVhUX1NTQUlBKSwKPgo+IFRoaXMgd2lsbCBjb25mbGljdCB3
aXRoIHRoYXQgSVNBIHN0cmluZyByZWZhY3RvcmluZyBJIGp1c3QgbWVyZ2VkLiAgSXQKPiBzaG91
bGQgYmUgYSBwcmV0dHkgbWVjaGFuaWNhbCBtZXJnZSBjb25mbGljdCwgYnV0IGlmIHlvdSB3YW50
IHdlIGNhbiBkbwo+IGEgc2hhcmVkIHRhZyB3aXRoIHRoZSBmaXJzdCBmZXcgcGF0Y2hlcyBhbmQg
SSBjYW4gaGFuZGxlIHRoZSBtZXJnZQo+IGNvbmZsaWN0IGxvY2FsbHkuCj4KPiA+ICAgICAgIF9f
UklTQ1ZfSVNBX0VYVF9EQVRBKHNzY29mcG1mLCBSSVNDVl9JU0FfRVhUX1NTQ09GUE1GKSwKPiA+
ICAgICAgIF9fUklTQ1ZfSVNBX0VYVF9EQVRBKHNzdGMsIFJJU0NWX0lTQV9FWFRfU1NUQyksCj4g
PiAgICAgICBfX1JJU0NWX0lTQV9FWFRfREFUQShzdmludmFsLCBSSVNDVl9JU0FfRVhUX1NWSU5W
QUwpLAo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyBiL2Fy
Y2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwo+ID4gaW5kZXggOTNlNDU1NjBhZjMwLi4zYzVi
NTFmNTE5ZDUgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMK
PiA+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwo+ID4gQEAgLTIyOCw2ICsy
MjgsOCBAQCB2b2lkIF9faW5pdCByaXNjdl9maWxsX2h3Y2FwKHZvaWQpCj4gPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBTRVRfSVNBX0VYVF9NQVAoInppaGludHBhdXNlIiwgUklTQ1Zf
SVNBX0VYVF9aSUhJTlRQQVVTRSk7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBT
RVRfSVNBX0VYVF9NQVAoInNzdGMiLCBSSVNDVl9JU0FfRVhUX1NTVEMpOwo+ID4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgU0VUX0lTQV9FWFRfTUFQKCJzdmludmFsIiwgUklTQ1ZfSVNB
X0VYVF9TVklOVkFMKTsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNFVF9JU0Ff
RVhUX01BUCgic21haWEiLCBSSVNDVl9JU0FfRVhUX1NNQUlBKTsKPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFNFVF9JU0FfRVhUX01BUCgic3NhaWEiLCBSSVNDVl9JU0FfRVhUX1NT
QUlBKTsKPiA+ICAgICAgICAgICAgICAgICAgICAgICB9Cj4gPiAgI3VuZGVmIFNFVF9JU0FfRVhU
X01BUAo+ID4gICAgICAgICAgICAgICB9CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
