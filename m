Return-Path: <SRS0=Ejrw=IP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5151DC433E6
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Mar 2021 05:06:02 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB75164F4F
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Mar 2021 05:06:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB75164F4F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=7OPMikPLo9WZxGigXV2UXVZFZurMilLn+IBC5vhH9Mg=; b=av5MLJ6SLFkI5tFfhk6VjaA/B
	87t4IVzZapRefXsH1q808n6QCbGJXLgvavTmn+v4X39jCXbOR4c/vGPFBWHwjvl+5sjEMyWPyjZ9Y
	SNcLhE9xwgv86ETDpKBfP473MXX9Ie3onBd320etUewTsbTNNfjPkQPljI2xz4lSIclGY/Gwfx3KO
	Ntoy7CTLkDyGjsOeWvYXPPEQ5/p6u+tmrhTfEGAxu6RRhSDMEsNwsgK0AiWQJtIhJu8wxDik+TRel
	6raGMnJl7igujTIKNS2X72NyeAGUXjDgkT15v6XFtWkyQwxCzYVB0wwg2zP+vbpTpiOn4rHFVR5Tb
	QVLRzKFJQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMONF-002TxO-Rq; Wed, 17 Mar 2021 05:05:37 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMON7-002Tvw-Vq
 for linux-riscv@lists.infradead.org; Wed, 17 Mar 2021 05:05:33 +0000
Received: by mail-pg1-x536.google.com with SMTP id p21so24072848pgl.12
 for <linux-riscv@lists.infradead.org>; Tue, 16 Mar 2021 22:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=MIc7mavbJhN4OuOMILSSjW63cQv0oc3j9t7W7Zfvn3k=;
 b=fU9xwamVIvSaTTINr66eyaN/9vLWy/U3RHTRoQtlV+QGM22cjCkVK6UdNds3atZs+v
 lwrY+tDyL/ppBr9hKvCmc5IxfzdMip2gaTAgZDGXQ6Xs04cFN2LQ24LlJRHotVOKvUCH
 3JTOqAzlDX8icJ+kSfK70sn7CrFvm1RYy3tiSUBmK5a1Qe6+mTFpFeTnFypUUxw9fUu+
 hmf2R+m08ZuVrQbnJz+5Z8NNKAvjRoeEgTM+fUUo3ZGYXk8A+F9ucXE8MBG9I3okFz/m
 2Vpx5x4E0li1OV10ow0sYyZw5BNS2RTRFdcPPoFDjl2yv+JiAs3XTkXMoVO32+7qLasj
 1GLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=MIc7mavbJhN4OuOMILSSjW63cQv0oc3j9t7W7Zfvn3k=;
 b=iyvJ0rj45r8fddNlP7PqR/oo4dFCAX1W/AcMUpXEuMzZJmBgPbRJ5CPzFnX7UU3LVk
 n4ZC3pVrOehFcko98LylAcXyFXkvJU7w0EK5RqgwtabB04DttCfNyVv53LrIfRfYFYjr
 iwAhdwo3bR5DlFt9XmyhouuDPiHNcxnwbYnjyMaJ3zakje/JvPR1r/kZHkMZ8p2yjDyr
 TsfK/e8tHkD/d9Qjrv2Lx1ndpGXOQJ7kB5HaNFIeVZ+0YM5140avFWqtKp9Yts8KT8fh
 foLTqmQ1dAtaomnSjWbHFcOhfKgGWBIbYIxR7L3+R9lB1/HIFPRutD6/rrJObfNWtSMw
 BGNQ==
X-Gm-Message-State: AOAM531pPcmcUVozJui2H6ZCBvwLd07lPbZ5YcWjqwi60bPmbVxrfu+q
 9PE89cliivk98PEI6UIanMkxAg==
X-Google-Smtp-Source: ABdhPJyDuEZydtGMqDr8/DG+kP9sdLoSZtmtej+zUMoDcsn6rZDQkEvlHQ9u8k2GdIn70gdBhSt7iA==
X-Received: by 2002:a62:e708:0:b029:1f8:c092:ff93 with SMTP id
 s8-20020a62e7080000b02901f8c092ff93mr2675554pfh.21.1615957528395; 
 Tue, 16 Mar 2021 22:05:28 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id i17sm19789935pfq.135.2021.03.16.22.05.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 22:05:27 -0700 (PDT)
Date: Tue, 16 Mar 2021 22:05:27 -0700 (PDT)
X-Google-Original-Date: Tue, 16 Mar 2021 21:58:03 PDT (-0700)
Subject: Re: [PATCH 0/3] Move kernel mapping outside the linear mapping
In-Reply-To: <0bb85388-c4e1-523a-9bf3-0ccec6c4041e@ghiti.fr>
CC: corbet@lwn.net, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, 
 Arnd Bergmann <arnd@arndb.de>, aryabinin@virtuozzo.com, glider@google.com,
 dvyukov@google.com, 
 linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, 
 kasan-dev@googlegroups.com, linux-arch@vger.kernel.org, linux-mm@kvack.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alex@ghiti.fr
Message-ID: <mhng-08cda2bf-fcd9-4848-b549-632d015e1acd@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210317_050531_814132_A08E8D77 
X-CRM114-Status: GOOD (  22.74  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gU2F0LCAxMyBNYXIgMjAyMSAwMToyNjo0NyBQU1QgKC0wODAwKSwgYWxleEBnaGl0aS5mciB3
cm90ZToKPiBIaSBQYWxtZXIsCj4KPiBMZSAzLzkvMjEgw6AgOTo1NCBQTSwgUGFsbWVyIERhYmJl
bHQgYSDDqWNyaXTCoDoKPj4gT24gVGh1LCAyNSBGZWIgMjAyMSAwMDowNDo1MCBQU1QgKC0wODAw
KSwgYWxleEBnaGl0aS5mciB3cm90ZToKPj4+IEkgZGVjaWRlZCB0byBzcGxpdCBzdjQ4IHN1cHBv
cnQgaW4gc21hbGwgc2VyaWVzIHRvIGVhc2UgdGhlIHJldmlldy4KPj4+Cj4+PiBUaGlzIHBhdGNo
c2V0IHB1c2hlcyB0aGUga2VybmVsIG1hcHBpbmcgKG1vZHVsZXMgYW5kIEJQRiB0b28pIHRvIHRo
ZSBsYXN0Cj4+PiA0R0Igb2YgdGhlIDY0Yml0IGFkZHJlc3Mgc3BhY2UsIHRoaXMgYWxsb3dzIHRv
Ogo+Pj4gLSBpbXBsZW1lbnQgcmVsb2NhdGFibGUga2VybmVsICh0aGF0IHdpbGwgY29tZSBsYXRl
ciBpbiBhbm90aGVyCj4+PiDCoCBwYXRjaHNldCkgdGhhdCByZXF1aXJlcyB0byBtb3ZlIHRoZSBr
ZXJuZWwgbWFwcGluZyBvdXQgb2YgdGhlIGxpbmVhcgo+Pj4gwqAgbWFwcGluZyB0byBhdm9pZCB0
byBjb3B5IHRoZSBrZXJuZWwgYXQgYSBkaWZmZXJlbnQgcGh5c2ljYWwgYWRkcmVzcy4KPj4+IC0g
aGF2ZSBhIHNpbmdsZSBrZXJuZWwgdGhhdCBpcyBub3QgcmVsb2NhdGFibGUgKGFuZCB0aGVuIHRo
YXQgYXZvaWRzIHRoZQo+Pj4gwqAgcGVyZm9ybWFuY2UgcGVuYWx0eSBpbXBvc2VkIGJ5IFBJQyBr
ZXJuZWwpIGZvciBib3RoIHN2MzkgYW5kIHN2NDguCj4+Pgo+Pj4gVGhlIGZpcnN0IHBhdGNoIGlt
cGxlbWVudHMgdGhpcyBiZWhhdmlvdXIsIHRoZSBzZWNvbmQgcGF0Y2ggaW50cm9kdWNlcyBhCj4+
PiBkb2N1bWVudGF0aW9uIHRoYXQgZGVzY3JpYmVzIHRoZSB2aXJ0dWFsIGFkZHJlc3Mgc3BhY2Ug
bGF5b3V0IG9mIHRoZQo+Pj4gNjRiaXQKPj4+IGtlcm5lbCBhbmQgdGhlIGxhc3QgcGF0Y2ggaXMg
dGFrZW4gZnJvbSBteSBzdjQ4IHNlcmllcyB3aGVyZSBJIHNpbXBseQo+Pj4gYWRkZWQKPj4+IHRo
ZSBkdW1wIG9mIHRoZSBtb2R1bGVzL2tlcm5lbC9CUEYgbWFwcGluZy4KPj4+Cj4+PiBJIHJlbW92
ZWQgdGhlIFJldmlld2VkLWJ5IG9uIHRoZSBmaXJzdCBwYXRjaCBzaW5jZSBpdCBjaGFuZ2VkIGVu
b3VnaCBmcm9tCj4+PiBsYXN0IHRpbWUgYW5kIGRlc2VydmVzIGEgc2Vjb25kIGxvb2suCj4+Pgo+
Pj4gQWxleGFuZHJlIEdoaXRpICgzKToKPj4+IMKgIHJpc2N2OiBNb3ZlIGtlcm5lbCBtYXBwaW5n
IG91dHNpZGUgb2YgbGluZWFyIG1hcHBpbmcKPj4+IMKgIERvY3VtZW50YXRpb246IHJpc2N2OiBB
ZGQgZG9jdW1lbnRhdGlvbiB0aGF0IGRlc2NyaWJlcyB0aGUgVk0gbGF5b3V0Cj4+PiDCoCByaXNj
djogUHJlcGFyZSBwdGR1bXAgZm9yIHZtIGxheW91dCBkeW5hbWljIGFkZHJlc3Nlcwo+Pj4KPj4+
IMKgRG9jdW1lbnRhdGlvbi9yaXNjdi9pbmRleC5yc3TCoMKgwqDCoMKgwqAgfMKgIDEgKwo+Pj4g
wqBEb2N1bWVudGF0aW9uL3Jpc2N2L3ZtLWxheW91dC5yc3TCoMKgIHwgNjEgKysrKysrKysrKysr
KysrKysrKysrKwo+Pj4gwqBhcmNoL3Jpc2N2L2Jvb3QvbG9hZGVyLmxkcy5TwqDCoMKgwqDCoMKg
wqAgfMKgIDMgKy0KPj4+IMKgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wYWdlLmjCoMKgwqDCoMKg
wqAgfCAxOCArKysrKystCj4+PiDCoGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5owqDC
oMKgIHwgMzcgKysrKysrKysrLS0tLQo+Pj4gwqBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NldF9t
ZW1vcnkuaCB8wqAgMSArCj4+PiDCoGFyY2gvcmlzY3Yva2VybmVsL2hlYWQuU8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgfMKgIDMgKy0KPj4+IMKgYXJjaC9yaXNjdi9rZXJuZWwvbW9kdWxlLmPCoMKg
wqDCoMKgwqDCoMKgwqAgfMKgIDYgKy0tCj4+PiDCoGFyY2gvcmlzY3Yva2VybmVsL3NldHVwLmPC
oMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMyArKwo+Pj4gwqBhcmNoL3Jpc2N2L2tlcm5lbC92bWxp
bnV4Lmxkcy5TwqDCoMKgwqAgfMKgIDMgKy0KPj4+IMKgYXJjaC9yaXNjdi9tbS9mYXVsdC5jwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDEzICsrKysrCj4+PiDCoGFyY2gvcmlzY3YvbW0v
aW5pdC5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgODEgKysrKysrKysrKysrKysr
KysrKysrKystLS0tLS0KPj4+IMKgYXJjaC9yaXNjdi9tbS9rYXNhbl9pbml0LmPCoMKgwqDCoMKg
wqDCoMKgwqAgfMKgIDkgKysrKwo+Pj4gwqBhcmNoL3Jpc2N2L21tL3BoeXNhZGRyLmPCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHzCoCAyICstCj4+PiDCoGFyY2gvcmlzY3YvbW0vcHRkdW1wLmPCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDY3ICsrKysrKysrKysrKysrKysrKystLS0tLQo+Pj4g
wqAxNSBmaWxlcyBjaGFuZ2VkLCAyNTggaW5zZXJ0aW9ucygrKSwgNTAgZGVsZXRpb25zKC0pCj4+
PiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL3Jpc2N2L3ZtLWxheW91dC5yc3QK
Pj4KPj4gVGhpcyBnZW5lcmFsbHkgbG9va3MgZ29vZCwgYnV0IEknbSBnZXR0aW5nIGEgYnVuY2gg
b2YgY2hlY2twYXRjaAo+PiB3YXJuaW5ncyBhbmQgc29tZSBjb25mbGljdHMsIGRvIHlvdSBtaW5k
IGZpeGluZyB0aG9zZSB1cCAoYW5kIGluY2x1ZGluZwo+PiB5b3VyIG90aGVyIGthc2FuIHBhdGNo
LCBhcyB0aGF0J3MgbGlrZWx5IHRvIGNvbmZsaWN0KT8KPgo+Cj4gSSBmaXhlZCBhIGZldyBjaGVj
a3BhdGNoIHdhcm5pbmdzIGFuZCByZWJhc2VkIG9uIHRvcCBvZiBmb3ItbmV4dCBidXQgaGFkCj4g
bm90IGNvbmZsaWN0cy4KPgo+IEkgaGF2ZSBqdXN0IHNlbnQgdGhlIHYyLgoKVGhhbmtzLiAgVGhl
c2UgKGFuZCB0aGUgc2Vjb25kIHBhdGNoIG9mIHRoZSBvbmUgSSBqdXN0IHB1dCBvbiBmaXhlcykg
YXJlCmZvci1uZXh0IHRoaW5ncywgc28gSSdtIG5vdCBnb2luZyB0byBnZXQgYSBsb29rIGF0IHRo
ZW0gdG9uaWdodCBiZWNhdXNlIEkgd2FudAp0byBtYWtlIHN1cmUgd2UgZG9uJ3QgaGF2ZSBhbnkg
bW9yZSBmaXhlcyBvdXRzdGFuZGluZy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
