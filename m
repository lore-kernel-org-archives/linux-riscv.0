Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BFE1EB64DD
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Jun 2023 01:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y4fsqT4XdUpA+APnPOytLfuwrPgHiQos4IO0GEiZSIM=; b=1UWUsNldKdrcxE
	usOLyMX/JY8rbjC3dgkpMeLoa4HC358AfY+DmlRvdZds+V4dBdMIU0oiWMbEzrcBJH1wv6U4wZrom
	wQqCii8CVN2QbeB7MElrAkbE0Vp6sqdWzJxfGtfZ+iK0TQFKQQBpdXcjr+x7cxnJGCdvjfPUGfXVr
	SgsDBlSJZ66ya7OcWIVtDRBXgF2lej0oZd+7ARoilcALYNkRMBGXozQMsa6dE6+2VPIMeLWaJZsZU
	37yJQZb4kKIBAbj4nXS1vTF/9dv6W0XSA4Hs4xbBwtSdgsCEip35yp0p3/GNlQxw+JCKBkC3+X2mb
	9HGjbiyXEqBiyou9GTEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCs9C-00503B-0Z;
	Sat, 24 Jun 2023 01:33:06 +0000
Received: from mail-dm6nam12olkn2080f.outbound.protection.outlook.com ([2a01:111:f400:fe59::80f] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCs99-00502E-0w
	for linux-riscv@lists.infradead.org;
	Sat, 24 Jun 2023 01:33:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Keiz1DeIdmfqLgq9VJX9wSB7CQd0GHi943+X2Y5rzbgL5Uojgl+YxmAI/fpvueWlNHbUEoGKRw1mwunKtnp/RRTF9x8zCOw5VRjzc+GmaUvptbXZWTF+YaLrgSyq+ZWPacqNNt42fb/8+yI6Ccw8xUpiHS+nI16K0bI5Xa75U6B4+mMyjeDx+HXy1XSI71JG+XcP8dH+ZJ+K07kQLASEVKHhTIeGpn4Sn6BxFrJqUzQLb9MecXKBbfB7aUsZZplWWIHyh3Wx+VbtGTTbPk9uLYR7nsDp1aChD4D8yX1TMhPZvrmST0UsirzZkrr3WrtzFHv035bSfCeGOCORNVV7CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=epj5RkMTe1qH451XeDGCIcNXYLWU2TjaWr8Ff7Q9Cn0=;
 b=etdMCMjsU+7AzHtils77jG2Zj4dwMq7/HA7WconPvaNomfST3L6iyODj3SJByRV7Fo69Q2vHSOKEFuQPGZOK52Nhws0Ux5x16OmiMRMMKN/7xegCLMuilEWxYK2G936pO1Sd7lp99QV5sSwn3Hl/BBk8VisMdvb8z7AwyUpOPraWXOv2KqKoWT9TRe79MeRZskh5uCKwgcoQufPgOG0TWxbFUOMGAJuAYFs2CXrNdjqOGCMg67XxLwXmL3B8xs+vS8JcPqUdnoNhXa83WO5G0plfmVuBnBp8CJmEB248TrlAmiUlij70+xbWvSzho07WiNN92I/CDHIHhVJhMxCs9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=epj5RkMTe1qH451XeDGCIcNXYLWU2TjaWr8Ff7Q9Cn0=;
 b=jz+5Wgc2UrE5uDXGiLFyYJ/MaCR31NEPUn5qn/FLivx76ibcFwTiqpQoQFvO7PNpfcA3AzadSRce9kYldL33xFxIfhJG7ukKxIn0htcZ28+iT/g+QoZ8y+tlnm/jfa8S+QbPVPn6iOOgjDmxUEu4zIUz0O2PORpzshmPuSO9/ioOBmrrLC+Xg9oHivOBPED7QId44VrcqP5/ly5yfyaU3Wd5Xc1QSQuVVXC6P+7M63nLlDK2YmCOvssxJx49M51Shx0WAK00cctdpaGDuz6R5e8SZVpjS0Smrp7rhMZFWWbvO2EFCBemsAAwqHpdhjM4zv95Wzp7YJ5GeZry7WbC+g==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by BL3PR20MB4921.namprd20.prod.outlook.com (2603:10b6:208:3b0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Sat, 24 Jun
 2023 01:32:53 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::1818:77d9:407b:dcd6]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::1818:77d9:407b:dcd6%3]) with mapi id 15.20.6521.024; Sat, 24 Jun 2023
 01:32:53 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nikita Shubin <n.shubin@yadro.com>,
	Inochi Amaoto <inochiama@outlook.com>
Cc: linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH V3] perf vendor events riscv: add T-HEAD C9xx JSON file
Date: Sat, 24 Jun 2023 09:32:47 +0800
Message-ID: <IA1PR20MB49536C0DA47122E9E3CB7CBBBB20A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <CAM9d7cjtisDVPijfU=iEGxc0YF=RnAt+r18Jg+8Av-+RAO=jeg@mail.gmail.com>
References: <CAM9d7cjtisDVPijfU=iEGxc0YF=RnAt+r18Jg+8Av-+RAO=jeg@mail.gmail.com>
X-TMN: [7u+aWMwo2m9INaTxe+Eho1G0RkY10PFGTMFvocVS5TpesSz0DVl6sJq3H/9uzvKB]
X-ClientProxiedBy: TYCPR01CA0048.jpnprd01.prod.outlook.com
 (2603:1096:405:1::36) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20230624013248.637913-1-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|BL3PR20MB4921:EE_
X-MS-Office365-Filtering-Correlation-Id: ad13cc2a-1e40-4faa-5ab9-08db7452edde
X-MS-Exchange-SLBlob-MailProps: ZILSnhm0P3nDUp8bIAwOWCqxT2NJSXd59YvOqHkdZDz7oZGh5TQfLlKLXKvcdMKEnuCmNZT935VLDxAli34rrEx6P2ku1YLyULx/hLbCkhjYnHlT6KWNYJRPuyFv9mJPg3dO0tJOHUaMyRC3FPOm6XoFJIns6Lv9opn/dMd7pqT+91iwRv6bAsKJoU1L8flBWtcforBXjdf2j10Gs6cheu7xr3U2h7pzj+wyirmOhEyGasS1g+6Up2jTKvnCeffcXBbQNcdNdt/iDdWRJ1rAdpyuGHEyFFv0IsbZGgJd8aa8m/04rrQlIdeKdOchIRJ3a4iqWEEIbQtYijUhO1qUAUWMSBZsdgoNrZKKBLrhsbpd/RPiDm0nHnkp0tXmhUGATQuQwSetvPQ19o+glHa1LNsnGX4ojcug5MUIhLTUvgj91peOVv1b5NGsl9lpZgos9F45WHOZCe9ZrAl/na+BvaRKkSsbqWZNclm+OKLoT4QBmnOZbKJ7UawO3rrOdqOxf9yDS9q3itjKjL9U3218Zs3pyzYDcOmrRXZO3DphTX1TZ94guWMoTVkuEimkhjHhjKAU/fZ/CyagKPI2NS+BLKnnygb67tH0PNGmGWvrJiEvwEzRE+AyoD46be4eOEIj9IvnxQF1R7rmUu39zUM51F8bCyyRds/bMBAnXeX40w1bU/XuvDVwx/u/1tg7Gc8pj1IJ5VJDRNurnzTqsMlMc1CLqU19QYUW52VcE3ROyqV2HA8qNE61q1pb4uiDOIjrRw3vDENybtHHtD1UaKcErqdVUi5NxY2L
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wycFMgHQNObQ/p46Ti2bShRarHjKxFJLxVaqVNGHtoRL2nuv4CXdSGQqJDPE0asLFxZHgZulBVnXAsRIHfAzU+ibt8wgXJPT+dHCj4OJFbV/ZX2Da9ulpUO3eIdJc8/tW+5nb/BdxQrE0QetPpaFfLw+kcv/VoGAWjNHKMTsq1krW5CdJ1BU6Rg9DXe5IMr3NVuLNibqnnvkfZqbn4uY/ZZWKTFZ/Z2xlu2R8dKuZpZex+E8T+UQAn1CkIqEjzEa+SWFIi5zK8+Qpk4GjVukO+jtqJkqG/kOAkjtKbjdnyNZRwh/qLVUmf3cfdEZayNfAnxfae0+JFIMYP8FZME9pWYYfOiJlRj3LjTJXhCVc1VLDyJwRK5ZqZYteowKa+3yligmGn2CpH3p85vm0DauPtrF4aaujc7PCPnM1kkkraC/TpaPhrG494FNlmjYz/2ey7vs7n2Qy8nB36c6WmPci2tj7WqNgulT2W5Nral6UwyCiMmRoLFJOKNqPSPGJrJ8ORW0Xgajkx6L4Ss4ga28eRLOABwsOdS3uG2+7J3l+vD4LXcFW3fuyhwXEsB0z2NuAXErR7Hz+y1LOmtPTQAOxvIx7x5rfrM6K545EPZauQtqJ4CQkTo06IQcQw0U887f
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QldHbDZmbnN0cm51a1E1NTJpanovQzZMTjdLbDltN21XZUNkaHMwTG1xaXEv?=
 =?utf-8?B?NFRaTU1GSTFHZXk3SjI4WjUxY0d3S1YvTmJJN1VqM3I1dk9SUXpuejNGYysr?=
 =?utf-8?B?ZWM3ck8wQnhZcHBDejRLOFdtcmdiaUFiSTNva3IvVDFQR2tCQTdTNHN0SDlr?=
 =?utf-8?B?bmJQanhJS2o3aUhMcTZnY1FUcGxYUzFkUUhhbzl2S0krYXpkbnpEekZtdFRM?=
 =?utf-8?B?RVhYZFRuM3R0UG9aM0FYSlkzY1ZWZnNadGxJWCt4c3lZcUxOWG5xWHYydGlp?=
 =?utf-8?B?L3FIQ0hCTzVpb29PU2JLTjhFYmdSM0hpa3VqOTJuVEFHK2VWempiUnRTZXV6?=
 =?utf-8?B?YWpoald5a2NUY2ljVy9yU2ZPREc3UUlycjlQYmFqR3BBRkZlb0RWbmJtMVhv?=
 =?utf-8?B?Z3VUMGZ0ZWl5N1Yvd2tpYmFubTZWODVtYm1NY1lsVm5vcVhGMUtxNWQ5cTV6?=
 =?utf-8?B?a0l2WmZNZDVpNGlUeWtscjM5T1FWeG9CVjRLK0VBbEcvckxSSUpyNWZZOGh4?=
 =?utf-8?B?aG5ySVJ1aWZTN1BHY3V3OUNFd084ZGYvaElrQTJvWDVvY1pncWdJNzg1NVhK?=
 =?utf-8?B?NC9SOWw4Ni9RWStLdE5aVmo4cHFVaFBqcXJaVFVsK2F2MlZNc0VON3RwbitG?=
 =?utf-8?B?MWFBQUZUS2RYdmxBNHZMN0N4U0IyeTgwZ3IwbzJiMjg5RXBSVk1WR1hGSm5E?=
 =?utf-8?B?UUVDMkVzOUNKVXVndTBEbEs4N1hrQStiaU55Q1p0RE1HbHZhZnlFeUhsOGZH?=
 =?utf-8?B?YVZOYWJVV0dTNTY1QnBsZ2w2aG9ud3p4YzBQeVBQbWxUOVF3Mk5UV3htTGlk?=
 =?utf-8?B?N0ZveGFrc1NNVnFXVG5UVGxscFBranAvQVdlSk0vMFFMU1JQNUFhc3Q2VU5D?=
 =?utf-8?B?TjNpMjVlbTB3Q2tHYXlGdXBxekdnTW52SndYQUFmVkEzS1RTeEdLUFVESTdj?=
 =?utf-8?B?TC9xaldTTEY0WW5IclA5dEJFSVA4Y2hmZzc4cGdyTjhpZ3FWWmp1YnBkUWNV?=
 =?utf-8?B?L3JGclBGcUNKZjUxOGc0WUxFU3hTaDljOVpoWDF5QjVobm5aVUdKSjhGc2di?=
 =?utf-8?B?bThTRjJoQUpJMzQ4aVl3NGNEUjdSRzE2bUM5OEFqMlFJdHo3YjZMZlNIbk8y?=
 =?utf-8?B?cStZSFI3K2VkbWFwRFBKQTNENUtTbWpic2hTbTI3TlUvM1FvWXZsektxYWVu?=
 =?utf-8?B?VjRJWjRReHJIQlFEVEpCVFJSSVhiWkhBWmhUUDhXWmdwd1hndytTWG1uUnBD?=
 =?utf-8?B?RG1oUHEwQ05nMlRCd1BRTi9FbkVxTUtzZC9IYXVyZDRzSG9YZlBCSXEyMXlJ?=
 =?utf-8?B?UzY2TXZuaTAvemJKYUhuM0xlRXFkODl4SS9GREZwdThUUUorb3pQYkExZHJv?=
 =?utf-8?B?bmp1dVd1dmZiclo4VEd4SXhGcnl1YWpHKytMMDJIT05kLzdUdVBpWXE2R0c3?=
 =?utf-8?B?NlBFTytEOFFDYklPaHJTdEthaE5paGJpYTlKMnh3Q2lMdDk4QlJLR0RYYlRk?=
 =?utf-8?B?VWZRakR0eEtCY1RISHdraWRON2sxOEkzL2x6ZW9CcHREcWJucDFsckJhTUFJ?=
 =?utf-8?B?T2RJZFQzbXpKR1loZC9kWlZDRTFhZ2NTbUhaWjVNZi9nM0dwU21USGJyN0Za?=
 =?utf-8?B?YVJIUGJqOWt1MkRMbkVVOGlzdFNlZTNjQ2ZVYmEwOUJxemNTM1pqTWRUYzA4?=
 =?utf-8?B?cWxvSWtnS0IwTTJiTHdWUDF2SWcyL0JBSkRXcEhQMnl5dCtXa0NDWVdRPT0=?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad13cc2a-1e40-4faa-5ab9-08db7452edde
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2023 01:32:53.3424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR20MB4921
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230623_183303_363563_4C75DC55 
X-CRM114-Status: GOOD (  21.36  )
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

SGksIE5hbWh5dW5nCgpTaW5jZSB0aGVyZSBpcyBhIGZhdWx0IGluIFQtSEVBRCBkb2N1bWVudGF0
aW9uLCBJIGFtIG5vdCBzdXJlIHdoZXRoZXIKdGhlIHBlcmYgZXZlbnRzIGFyZSBjb3JyZWN0LiBB
cyBhIHJlc3VsdCwgSSBzdWdnZXN0IHRlbXBvcmFyaWx5IHN1cHByZXNzaW5nCnRoaXMgcGF0Y2gg
dW50aWwgSSBleHRyYWN0IHRoZSBjb3JyZWN0IGV2ZW50cyBmcm9tIGl0cyB2ZW5kb3IgcGVyZiBk
cml2ZXIuCkkgd2lsbCBwcmVwYXJlIGEgbmV3IFY0IHBhdGNoIG9uY2UgaXQgaXMgZmluaXNoZWQu
CgpBcyBmb3IgYzl4eCB3aWxkY2FyZCwgdGhlIFQtSEVBRCBwcm92aWRlcyBhIGBNQ1BVSURgIHZl
bmRvciBDU1IgdG8gYWxsb3cKaXRzIENLTElOSyB0byBnZXQgdGhlIGRldGFpbCBDUFUgaW5mby4g
VGhlIGZvcm1hdCBvZiB0aGlzIENTUiBhcmU6CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KfDMxICAgMjh8MjcgIDI2fDI1ICAgIDIyfDIxICAgMTh8MTcg
ICAgOHw3ICAgIDB8CnwgaW5kZXggfCBXTFJMIHwgZmFtaWx5IHwgY2xhc3MgfCBtb2RlbCB8IFdM
UkwgfAotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KCkFu
ZCBmb3IgQzl4eCBzZXJpZXMgKG9ubHkgaW5kZXggMDAwMCBpcyB2YWlsZCBmb3IgdXMsIGFzIGBN
Q1BVSURgIGFsc28KcHJvdmlkZXMgb3RoZXIgaW5kZXgpLgoKfCAwMDAwIHwgeHggfCAwMTAwIHwg
Y2xhc3MgfCB4eHh4eHh4eHh4IHwgeHh4eHh4eHggfAoKVGhlIGNsYXNzIGNvZGVzIGFyZToKCkM5
MTA6IDAwMTEKYzkwNjogMDEwMAoKVGhlIENTUiBpcyBhIE0tbW9kZSBvbmx5IENTUiwgc28gbm93
IEknbSBleHBsb3JpbmcgYSBjbGVhbiB3YXkgdG8KaW50ZWdyYXRlIHRoaXMgQ1NSIGludG8gdGhl
IGtlcm5lbC4gQW55IGFkdmljZT8KClRoYW5rcywKSW5vY2hpCgo+IEhlbGxvLAo+Cj4gT24gVGh1
LCBNYXkgMTgsIDIwMjMgYXQgMjo1MOKAr0FNIElub2NoaSBBbWFvdG8gPGlub2NoaWFtYUBvdXRs
b29rLmNvbT4gd3JvdGU6Cj4gPgo+ID4+IGxpY2hlZXJ2ICMgcGVyZiByZWNvcmQKPiA+PiBbICA0
MzIuMDE1NjE4XSB3YXRjaGRvZzogQlVHOiBzb2Z0IGxvY2t1cCAtIENQVSMwIHN0dWNrIGZvciAy
NnMhCj4gPj4gW3BlcmY6MTE3XQo+ID4+IFsgIDQ2MC4wMTU2MTddIHdhdGNoZG9nOiBCVUc6IHNv
ZnQgbG9ja3VwIC0gQ1BVIzAgc3R1Y2sgZm9yIDUycyEKPiA+PiBbcGVyZjoxMTddCj4gPj4gWyAg
NDg4LjAxNTYxNl0gd2F0Y2hkb2c6IEJVRzogc29mdCBsb2NrdXAgLSBDUFUjMCBzdHVjayBmb3Ig
NzhzIQo+ID4+IFtwZXJmOjExN10KPiA+PiBbICA1MTYuMDE1NjE3XSB3YXRjaGRvZzogQlVHOiBz
b2Z0IGxvY2t1cCAtIENQVSMwIHN0dWNrIGZvciAxMDRzIQo+ID4+IFtwZXJmOjExN10KPiA+Pgo+
ID4+IEJ1dCB0aGF0J3Mgbm90IHJlbGF0ZWQgdG8geW91ciBwYXRjaCBhbnl3YXkuCj4gPgo+ID4g
U2FtZSBpc3N1ZSBvbiBjOTIwLCBidXQgaXQgZGlkIG5vdCBhbHdheXMgb2NjdXIuCj4gPiBMaWtl
IGEgc2JpIGlzc3VlIGZvciBULUhFQUQgY3B1cy4KPiA+Cj4gPj4gSSBhbSBzdHJvbmdseSBhZ2Fp
bnN0IHVzaW5nICJjOXh4IiB3aWxkY2FyZCwgaSB3b3VsZCBwcmVmZXIgZGVjbGFyaW5nCj4gPj4g
dGhlbSBzZXBhcmF0ZSAoZXNwZWNpYWxseSB0YWtpbmcgaW4gbWluZCB0aGF0IGM5MjAgaXMgYzkx
MCB3aXRoIHZlY3Rvcgo+ID4+IC0gQUZBSUspLCBidXQgdGhhdCdzIHVwIHRvIEFybmFsZG8gdG8g
ZGVjaWRlLgo+ID4KPiA+IEFGQUlLLCB0aGVyZSBpcyBubyByZWxpYWJsZSB3YXkgdG8gZGlzdGlu
Z3Vpc2ggYzkwNiBhbmQgYzkxMCBjb3Jlcy4gQW5kCj4gPiB0aGUgZXZlbnRzIG9mIGM5MTAgYW5k
IGM5MjAgYXJlIHRoZSBzYW1lIChhY2NvcmRpbmcgdG8gdGhlIGRyYWZ0IGRvY3VtZW50Cj4gPiBv
ZiB0aGUgYzkyMCkuCj4gPgo+ID4gQW55d2F5LCBJIGFncmVlIHRvIGxldCBBcm5hbGRvIGRlY2lk
ZS4KPiA+Cj4gPj4gVGVzdGVkLWJ5OiBOaWtpdGEgU2h1YmluIDxuLnNodWJpbkB5YWRyby5jb20+
Cj4KPiBJJ20gY29sbGVjdGluZyBwYXRjaGVzIG9uIGJlaGFsZiBvZiBBcm5hbGRvIHRoaXMgdGlt
ZS4KPiBJdCBzZWVtcyB0aGlzIHBhdGNoIHdhcyBub3QgcGlja2VkIHVwIGZvciBhIGxvbmcgdGlt
ZS4KPgo+IEkgdGhpbmsgd2UgY2FuIG1ha2UgY2hhbmdlcyBmb3IgdGhlIGM5eHggd2lsZGNhcmQg
bGF0ZXIKPiBpZiBuZWVkZWQuICBJJ2xsIHByb2Nlc3MgaXQgaW4gdGhlIGN1cnJlbnQgZm9ybS4K
Pgo+IFRoYW5rcywKPiBOYW1oeXVuZwo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
